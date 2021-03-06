# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'hackfest2016-quaoar', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-hackfest2016-quaoar'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '855bcc5db53d0cddf03080ff607adb1a'\
                                      '01addea3833ac68163a0dc46226c5677'
    target.vm.boot_timeout = 10
    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-hackfest2016-quaoar']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
