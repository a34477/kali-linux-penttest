# -*- coding: utf-8 -*-
#
# Only adapter 1 is working.
# Root it and setup others interfaces!
#
def target(vconfig, _custom)
  vconfig.vm.define 'kevgir', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-kevgir'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'e67714c11e7c9db7ca4427baf08746e8'\
                                      '7fecfb92b635af174a3f666c39b53111'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kevgir']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
