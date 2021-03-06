# -*- coding: utf-8 -*-
#
# Only adapter 1 is working.
# Root it and setup others interfaces!
#
def target(vconfig, _custom)
  vconfig.vm.define 'gibson', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-gibson'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '7c2a9f803d9d07bb21e7b470b0bc28a4'\
                                      '43763482aabf07849604c5eaf54ef0d3'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-gibson']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
