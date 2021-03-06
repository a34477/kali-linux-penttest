# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :win7ie9, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = 'winrm'
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'win7-ie9'
    target.vm.box_url = 'http://aka.ms/vagrant-win7-ie9'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-win7ie9']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
