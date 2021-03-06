# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define :pipe, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-pipe'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'c350368320ce835c11cc2c35ba1c9287'\
                                      '5aecddfff02a1e9b1296487530ffe9d7'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-pipe']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
