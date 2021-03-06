# -*- coding: utf-8 -*-
#
# Works with 1 interface
#
def target(vconfig, _custom)
  vconfig.vm.define 'dc416-basement', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-dc416-basement'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '693a6db896f00fa701d933c3798737e6'\
                                      '56db24e9dac1de51f09f739e97c235cc'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-dc416-basement']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
