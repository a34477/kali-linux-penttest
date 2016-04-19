# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :primer, autostart: false do |target|
    target.vm.box = 'vulnhub-primer-1.0.1'
    target.vm.box_url = 'http://box.hackbbs.org/vulnhub-primer-1.0.1.box'

    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.ssh.username = 'root'
    target.ssh.private_key_path = 'ssh-keys/pentest-env'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-primer']
      v.customize ['modifyvm', :id, '--memory', 256]
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end
