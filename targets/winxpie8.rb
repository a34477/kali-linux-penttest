# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :winxpie8, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = :winrm
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'xp-ie8'
    target.vm.box_url = 'http://aka.ms/vagrant-xp-ie8'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-winxpie8']
      v.customize ['modifyvm', :id, '--memory', 256]
    end
  end
end
