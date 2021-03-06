# -*- coding: utf-8 -*-
#
# Works with 1 adapters
# 2 adapter if you set 192.168.56.20 ip address for first adapter
#
def target(vconfig, _custom)
  vconfig.vm.define 'defence-space-ctf', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-defence-space-ctf'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'dcf25110a3fe602c608b251b7d716295'\
                                      'f0f1ac898c5a6e9b9d991ba54c7566cd'
    target.vm.boot_timeout = 10
    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-defence-space-ctf']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
