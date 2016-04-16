# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :metasploitable do |target|
    target.vm.box = 'metasploitable2'
    target.vm.box_url = 'http://box.hackbbs.org/metasploitable2.box'

    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.ssh.username = 'msfadmin'
    target.ssh.password = 'msfadmin'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable']
      v.customize ['modifyvm', :id, '--memory', 512]
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end
