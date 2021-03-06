# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define :violator, autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-violator'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '9765e3216029e45c4410e9dca545472c'\
                                      '3d23cbbb85eff412399372ae35eb8036'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-violator']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
