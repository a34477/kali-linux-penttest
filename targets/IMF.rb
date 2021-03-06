# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define :IMF, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-imf'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '402923677aac7c7060db32fcacf1a8e2'\
                                      '609d0a85c088c5b584369364e04cfa2b'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-imf']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
