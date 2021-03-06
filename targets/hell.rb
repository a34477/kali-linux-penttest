# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define :hell, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-hell'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '8df8b5dd8aec21666a508101fa94d931'\
                                      '5c2e806a6bcbc0b9f5e5a4bc2bd2a8af'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-hell']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
