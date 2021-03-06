# -*- coding: utf-8 -*-

def instance(vconfig, custom)
  c = custom['config']

  # Network
  fqdn = c.include?('fqdn') ? c['fqdn'] : 'db.pentest.env'
  private_subnet = c.include?('private_subnet') ? c['private_subnet'] : '10.14.42.0/24'
  private_ip = c.include?('private_ip') ? c['private_ip'] : '10.14.42.11'

  # Databases
  postgres_pass = c.include?('postgres_pass') ? c['postgres_pass'] : 'postgres'
  msfdb_name = c.include?('msfdb_name') ? c['msfdb_name'] : 'msf'
  msfdb_user = c.include?('msfdb_user') ? c['msfdb_user'] : 'msf'
  msfdb_pass = c.include?('msfdb_pass') ? c['msfdb_pass'] : 'msf'

  Pentestenv::Customization.install_chef('database', vconfig)
  vconfig.vm.define :database, primary: false, atostart: false do |database|
    database.vm.box = 'debian/contrib-jessie64'

    database.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-database']
      v.customize ['modifyvm', :id, '--memory', 1024]
    end

    database.vm.provision :chef_solo do |chef|
      chef.install = false
      chef.cookbooks_path = 'cookbooks/'
      chef.roles_path = 'chef-repo/roles'

      chef.add_recipe('apt')
      chef.add_recipe('build-essential')
      chef.add_recipe('elite::packages')
      chef.add_recipe('hostname')
      chef.add_role('couchdb-from-source')
      chef.add_role('postgresql-server')
      chef.add_recipe('pentester::msf_db')

      chef.json = {
        set_fqdn: fqdn,
        elite: {
          packages: ['libc6-dev', 'libpq-dev']
        },
        postgresql: {
          config: {
            listen_addresses: private_ip
          },
          password: {
            postgres: postgres_pass
          },
          pg_hba: [
            {
              comment: 'pentest-env private network',
              type: 'host',
              db: 'all',
              user: 'all',
              addr: private_subnet,
              method: 'md5'
            }
          ]
        },
        couch_db: {
          config: {
            httpd: {
              bind_address: private_ip
            }
          }
        },
        pentester: {
          db: {
            host: private_ip
          },
          msf: {
            db: {
              db: msfdb_name,
              user: msfdb_user,
              pass: msfdb_pass
            }
          }
        }
      }
    end
  end
end
