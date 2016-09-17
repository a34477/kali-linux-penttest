# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :metasploitable3, autostart: false do |target|
    target.vm.box = 'pentestenv/metasploitable3'
    target.vm.box_url = 'http://box.hackbbs.org/metasploitable3.box'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '3ec20e1ba7a4169511866376ffa92b28'\
                                      '332d553b77e01f60f9b836414aff194c'
    target.vm.communicator = 'winrm'

    target.ssh.username = 'vagrant'
    target.ssh.password = 'vagrant'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable3']
      v.customize ['modifyvm', :id, '--memory', 1024]
    end
  end
end
