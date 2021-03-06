# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define 'the-net', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-the-net'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'db03f5867a6733405b3737fbfdb688f7'\
                                      'c17702dc50c79796dd93a838cce419bd'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-the-net']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
