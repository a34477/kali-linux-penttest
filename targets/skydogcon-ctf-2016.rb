# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define 'skydogcon-ctf-2016', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-skydogcon-ctf-2016'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'e3312e03d535b40a59500a0c7f56791a'\
                                      'f6f88e71c4de47534b7cd7444c154d2a'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-skydogcon-ctf-2016']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
