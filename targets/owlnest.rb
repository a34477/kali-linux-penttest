# -*- coding: utf-8 -*-
#
# Works only with adapter 1
#
def target(vconfig, _custom)
  vconfig.vm.define :owlnest, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-owlnest'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '6fb96d7a030d9e8c8fc750892f959b4b'\
                                      'b68d827eb8305937932cf4b0efd50bca'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-owlnest']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
