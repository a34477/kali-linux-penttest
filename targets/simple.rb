# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define :simple, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-simple'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'f258dd630adca903fc2368aea7ddcde7'\
                                      '5819641402a0712a0090270d8ee21027'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-simple']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
