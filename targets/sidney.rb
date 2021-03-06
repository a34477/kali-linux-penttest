# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define :sidney, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-sidney'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'bdb99ef6307c4b6b8d63a1b72a59c1fe'\
                                      '33ef3865739aef6023951973e2cdd2d2'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-sidney']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
