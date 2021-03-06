# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'fart-knocker', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-fart-knocker'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '1a04bce9c0d03dfb3d96f53fd3dc0362'\
                                      '26ee5554fb014c1a93aab5fbf3402bf8'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-fart-knocker']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
