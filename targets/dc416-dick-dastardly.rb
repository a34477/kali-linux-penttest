# -*- coding: utf-8 -*-
#
# Works with 3 interfaces
#
def target(vconfig, _custom)
  vconfig.vm.define 'dc416-dick-dastardly', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-dc416-dick-dastardly'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = 'e57eb5d3117a39aed0bfeacc1bf6e863'\
                                      'd2e1b2b95a76884e7d2a72d650602d18'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id,
                   '--name', 'pentest-env-dc416-dick-dastardly']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
