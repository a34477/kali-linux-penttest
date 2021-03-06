# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'csharp-vuln-json', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-csharp-vuln-json'
    target.vm.boot_timeout = 10
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'ad4a8b6b2cbbcc59ad96819a9551c4ed'\
                                      '8ed52709b758fd1d7bb49ae9fa6a86f0'

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-csharp-vuln-json']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
