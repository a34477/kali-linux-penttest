# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :primer, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-primer'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '342bb82ebce63a819575ba2f2b7a4a2d'\
                                      '4fa53c70bd377076cdffbf9b3a0788f4'

    target.ssh.username = 'root'
    target.ssh.private_key_path = 'ssh-keys/pentest-env'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-primer']
      v.customize ['modifyvm', :id, '--memory', 256]
    end
  end
end
