# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'metasploitable3-win2008r2', autostart: false do |target|
    target.vm.box = 'Sliim/metasploitable3-win2008r2'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'cae95fdba710d1c1e68539d9bb9acb07'\
                                      '9b6935625bfba929b9de862155d07498'
    target.vm.communicator = 'winrm'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable3-win2008r2']
      v.customize ['modifyvm', :id, '--memory', 4096]
    end
  end
end
