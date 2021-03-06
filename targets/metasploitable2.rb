# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :metasploitable2, autostart: false do |target|
    target.vm.box = 'Sliim/metasploitable2'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '3112d99b89a322c77d8f76f8c42ba55f'\
                                      '420db405757387b4730a487dc9934141'
    target.vm.guest = :debian

    target.ssh.username = 'msfadmin'
    target.ssh.password = 'msfadmin'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable2']
      v.customize ['modifyvm', :id, '--memory', 256]
    end
  end
end
