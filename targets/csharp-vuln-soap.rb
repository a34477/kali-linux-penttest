# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'csharp-vuln-soap', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-csharp-vuln-soap'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'dbf8cbedabe4dd82056c64bb6c41608b'\
                                      'f4c959aeab04a8739e18e979192d70cb'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-csharp-vuln-soap']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
