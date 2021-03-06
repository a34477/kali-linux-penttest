# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define 'rop-primer', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-rop-primer'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '62e7d66eb94fa20e69acc9bc4c9828ec'\
                                      '195d3f14e173a268e38f342efc84470c'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-rop-primer']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
