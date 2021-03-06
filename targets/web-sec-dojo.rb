# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'web-sec-dojo', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-web-security-dojo'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'a8bf7c87c9a5797518d4bb36255d7b93'\
                                      'dd9d7eb92e88f851f86e400f142236eb'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-web-sec-dojo']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
