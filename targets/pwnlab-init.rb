# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define 'pwnlab-init', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-pwnlab-init'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'c23fe5c0edb36b14ed15d8ab5ad014d5'\
                                      'bda4abef0cc5ed8de770164bbf963081'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-pwnlab-init']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
