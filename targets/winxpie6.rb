# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :winxpie6, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = :winrm
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'xp-ie6'
    target.vm.box_url = 'http://aka.ms/vagrant-xp-ie6'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-winxpie6']
      v.customize ['modifyvm', :id, '--memory', 256]
    end
  end
end
