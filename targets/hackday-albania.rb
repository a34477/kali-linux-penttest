# -*- coding: utf-8 -*-
#
# Works with 1 interface
#
def target(vconfig, _custom)
  vconfig.vm.define 'hackday-albania', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-hackday-albania'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '17c3e4f049a50288c581752631ccffa5'\
                                      'caaae3a2059afb585f7f793268aed8ac'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-hackday-albania']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
