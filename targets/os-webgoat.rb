# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define 'os-webgoat', autostart: false do |target|
    target.ssh.username = 'ubuntu'

    target.vm.provider 'openstack' do |os|
      os.openstack_auth_url = "#{ENV['OS_AUTH_URL']}/tokens"
      os.username = ENV['OS_USERNAME']
      os.password = ENV['OS_PASSWORD']
      os.tenant_name = ENV['OS_TENANT_NAME']
      os.flavor = 'cd.small'
      os.image = 'ubuntu-12.04-cloudimg'
      os.floating_ip_pool = 'public'
      os.networks = 'private-net'
    end

    target.vm.provision :chef_solo do |chef|
      chef.add_recipe('webgoat')
    end
  end
end
