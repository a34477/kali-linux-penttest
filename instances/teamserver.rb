# -*- coding: utf-8 -*-

def instance(vconfig, custom)
  c = custom['config']

  # Network
  fqdn = c.include?('fqdn') ? c['fqdn'] : 'teamserver.pentest.env'
  private_subnet = c.include?('private_subnet') ? c['private_subnet'] : '10.14.42.0/24'
  private_ip = c.include?('private_ip') ? c['private_ip'] : '10.14.42.10'
  public_subnet = c.include?('public_subnet') ? c['public_subnet'] : '172.16.42.0/24'
  public_ip = c.include?('public_ip') ? c['public_ip'] : '172.16.42.184'
  db_ip = c.include?('db_ip') ? c['db_ip'] : '10.14.42.11'

  # Credz
  postgres_pass = c.include?('postgres_pass') ? c['postgres_pass'] : 'postgres'
  msf_pass = c.include?('msf_pass') ? c['msf_pass'] : 'msf'
  beef_user = c.include?('beef_user') ? c['beef_user'] : 'beef'
  beef_pass = c.include?('beef_pass') ? c['beef_pass'] : 'beef'
  msfdb_name = c.include?('msfdb_name') ? c['msfdb_name'] : 'msf'
  msfdb_user = c.include?('msfdb_user') ? c['msfdb_user'] : 'msf'
  msfdb_pass = c.include?('msfdb_pass') ? c['msfdb_pass'] : 'msf'

  # Teamserver ports
  proxy_port = c.include?('proxy_port') ? c['proxy_port'] : '55555'
  msfrpc_port = c.include?('msfrpc_port') ? c['msfrpc_port'] : '55554'
  armitage_port = c.include?('armitage_port') ? c['armitage_port'] : '55553'

  Pentestenv::Customization.install_chef('teamserver', vconfig)
  vconfig.vm.define :teamserver, primary: false, autostart: false do |teamserver|
    teamserver.ssh.private_key_path = 'ssh-keys/pentest-env'
    teamserver.ssh.username = 'root'

    teamserver.vm.box = 'Sliim/kali-2016.2-light-amd64'
    teamserver.vm.box_download_checksum_type = 'sha256'
    teamserver.vm.box_download_checksum = '5d455bf1cf8d7b2b4f3be7c4b3cc4315'\
                                          '2ae5cfe09eaf4aaf30ac112aa6bd3b40'

    teamserver.vm.guest = :debian

    teamserver.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-teamserver']
      v.customize ['modifyvm', :id, '--memory', 4096]
    end

    teamserver.vm.provision :chef_solo do |chef|
      chef.install = false
      chef.cookbooks_path = 'cookbooks/'
      chef.roles_path = 'chef-repo/roles'

      chef.add_recipe('apt')
      chef.add_recipe('git')
      chef.add_recipe('hostname')
      chef.add_role('metasploit-package')
      chef.add_recipe('pentester::msf_config')
      chef.add_role('beef-server')
      chef.add_role('beef-metasploit-extension')
      chef.add_role('armitage-teamserver')
      chef.add_recipe('pentestenv::faraday_metasploiton_plugin')
      chef.add_role('faraday-from-package')
      chef.add_role('faraday-server')
      chef.add_recipe('elite')
      chef.add_recipe('elite::dotfiles')
      chef.add_recipe('elite::packages')
      chef.add_recipe('elite::zsh')
      chef.add_recipe('elite::tmux')
      chef.add_recipe('pentester::kalihud')
      chef.add_recipe('pentester::mitmproxy')
      chef.add_recipe('elite::stuff')

      chef.json = {
        set_fqdn: fqdn,
        faraday: {
          config: {
            last_workspace: 'default',
            couch_uri: "http://#{private_ip}:5985"
          },
          server: {
            config: {
              faraday_server: {
                bind_address: private_ip
              },
              couchdb: {
                host: db_ip
              }
            }
          }
        },
        beef: {
          config: {
            beef: {
              restrictions: {
                permitted_hooking_subnet: public_subnet,
                permitted_ui_subnet: private_subnet
              },
              credentials: {
                user: beef_user,
                passwd: beef_pass
              },
              http: {
                hook_file: '/main.js',
                session_cookie_name: '__PHPSESSID',
                hook_session_name: 'ANTI_CSRF_TOKEN',
                web_server_imitation: {
                  hook_404: true,
                  hook_root: true
                }
              }
            },
            extensions: {
              metasploit: {
                pass: msf_pass,
                callback_host: public_ip,
                autopwn_url: 'loading'
              }
            }
          }
        },
        pentester: {
          db: {
            host: db_ip,
            password: postgres_pass
          },
          teamserver: {
            bind_addr: private_ip,
            password: msf_pass
          },
          msf: {
            db: {
              db: msfdb_name,
              user: msfdb_user,
              pass: msfdb_pass
            }
          }
        },
        elite: {
          users: %w[root],
          groups: %w[root],
          packages: %w[nload htop],
          root: {
            group: 'root',
            home: '/root',
            shell: '/bin/zsh',
            zsh: {
              plugins: {
                elite: %w[tmux kali]
              },
              config: {
                color2: '009',
                color1: '255',
                rbenv_prompt: false,
                pyenv_prompt: false,
                ndenv_prompt: false
              }
            },
            tmux: {
              color: {
                message_bg: 'black',
                message_fg: 'brightred',
                status_bg: 'black',
                status_fg: 'colour240',
                status_current_bg: 'black',
                status_current_fg: 'colour009',
                pane_border_bg: 'default',
                pane_border_fg: 'colour240',
                pane_active_border_bg: 'default',
                pane_active_border_fg: 'colour009'
              },
              status: {
                rbenv_status: false,
                ndenv_status: false,
                pyenv_status: false
              },
              scripts: {
                teamserver: {
                  path: '/root/ts',
                  default_window: '0',
                  windows: {
                    '0' => {
                      name: 'services',
                      win: {
                        '0' => 'split-window -h {TARGET}',
                        '1' => 'select-pane {TARGET}0',
                        '2' => 'split-window -v {TARGET}',
                        '3' => 'select-pane {TARGET}2',
                        '4' => 'split-window -v {TARGET}',
                        '5' => 'select-pane {TARGET}2',
                        '6' => 'split-window -v {TARGET}',
                        '7' => 'select-pane {TARGET}4',
                        '8' => 'split-window -v {TARGET}'
                      },
                      cmds: {
                        '0' => "msfconsole -x 'load msgrpc ServerHost=127.0.0.1 ServerPort=#{msfrpc_port} Pass=#{msf_pass}'",
                        '1' => "mitmproxy -b #{private_ip} -p #{proxy_port} -R http://127.0.0.1:#{msfrpc_port} --follow",
                        '2' => "sleep 10s; /root/stuff/dockerfiles/teamserver_custom/teamserver #{public_ip} #{msfrpc_port} #{msfdb_user} #{msf_pass} #{armitage_port}",
                        '3' => "cd ~/.msf4/loot/; python3 -m http.server 4242 --bind #{private_ip}",
                        '4' => 'htop',
                        '5' => 'nload'
                      }
                    }
                  }
                }
              }
            },
            stuff: {
              repository: 'https://github.com/Sliim/elite-stuff.git',
              install_path: '/root/stuff'
            }
          }
        }
      }
    end
  end
end
