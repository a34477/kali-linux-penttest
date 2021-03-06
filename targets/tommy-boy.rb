# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'tommy-boy', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-tommy-boy'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '603f9e5fe1c164d04b69ff3a3c7936eb'\
                                      '5c198f29f4f7a5f139bd62a69f1609f7'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-tommy-boy']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
