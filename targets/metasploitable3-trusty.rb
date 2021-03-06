# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'metasploitable3-trusty', autostart: false do |target|
    target.vm.box = 'Sliim/metasploitable3-trusty'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'ed3bb5bfa1fef2b585a1748afa03ebf7'\
                                      '2f7a1dad876d012ff42759b49447aea4'

    target.vm.synced_folder '.', '/vagrant', disabled: true
    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable3-trusty']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
