# -*- coding: utf-8 -*-
def target(vconfig, _custom)
  vconfig.vm.define 'docker-host', autostart: false do |target|
    target.vm.box = 'debian/contrib-jessie64'

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-docker-host']
      v.customize ['modifyvm', :id, '--memory', 1024]
    end

    target.vm.provision :chef_solo do |chef|
      chef.add_recipe('elite::docker_host')
      chef.add_recipe('pentestenv::docker_vulnerable_containers')
    end
  end
end
