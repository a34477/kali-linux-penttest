# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :win2012dc, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = :winrm
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'opentable/win-2012r2-datacenter-amd64-nocm'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-win2012dc']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
