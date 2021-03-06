# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'mrrobot', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-mrrobot'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'be655cc47644b03880e8739f66fabf16'\
                                      '5ac171682bd11c0bb5f56030142fad89'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-mrrobot']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
