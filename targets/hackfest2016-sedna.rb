# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'hackfest2016-sedna', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-hackfest2016-sedna'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '97488f04f5038a9d5411cbcdc82f79eb'\
                                      '2d676d3b3387d8e4195894ac41dc96b0'
    target.vm.boot_timeout = 10
    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-hackfest2016-sedna']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
