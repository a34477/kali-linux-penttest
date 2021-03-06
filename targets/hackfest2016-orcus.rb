# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'hackfest2016-orcus', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-hackfest2016-orcus'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'fd8b2324ccd41e4d9da5e51421cde004'\
                                      'c47b91573e2764aa20dc24db87996ca1'
    target.vm.boot_timeout = 10
    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-hackfest2016-orcus']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
