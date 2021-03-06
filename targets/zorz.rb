# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define :zorz, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-zorz'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '9e4980628b9411bb0a007d4275298872'\
                                      '8076f0846184ce8377bd285f20017219'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-zorz']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
