# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :win8ie10, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = 'winrm'
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'win8-ie10'
    target.vm.box_url = 'http://aka.ms/vagrant-win8-ie10'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-win8ie10']
      v.customize ['modifyvm', :id, '--memory', 1024]
    end
  end
end
