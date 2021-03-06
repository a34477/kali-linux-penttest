# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :win2008web, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = :winrm
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'opentable/win-2008r2-web-amd64-nocm'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-win2008web']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
