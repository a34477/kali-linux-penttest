# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :vistaie7, autostart: false do |target|
    target.vm.guest = :windows
    target.vm.boot_timeout = 300
    target.vm.communicator = 'winrm'
    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.box = 'vista-ie7'
    target.vm.box_url = 'http://aka.ms/vagrant-vista-ie7'

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-vistaie7']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
