# -*- coding: utf-8 -*-
#
# Works with 3 interfaces
#
def target(vconfig, _custom)
  vconfig.vm.define 'dc416-baffle', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-dc416-baffle'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '2579f2298685a39be3ffffc21323b87f'\
                                      '23dcd7ec057f2bb3f0900f682cbd3b53'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-dc416-baffle']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
