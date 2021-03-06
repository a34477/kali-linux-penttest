# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define :teuchter, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-teuchter'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'e6fcf2ce0250e7c75c2d015ae55e0e30'\
                                      'c2562093bed85912c4e13c7e5e20d3c5'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-teuchter']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
