# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :metasploitable3, autostart: false do |target|
    target.vm.box = 'Sliim/metasploitable3'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '3a8cdf2c7090092332ac950678b35f95'\
                                      '67e5ac6508a2acaa277a743892f7eaf3'
    target.vm.communicator = 'winrm'
    target.winrm.username = 'Administrator'
    target.ssh.username = 'Administrator'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable3']
      v.customize ['modifyvm', :id, '--memory', 1024]
    end
  end
end
