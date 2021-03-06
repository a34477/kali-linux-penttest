# -*- coding: utf-8 -*-
#
# Works with 3 adapters
#
def target(vconfig, _custom)
  vconfig.vm.define 'skydog-ctf', autostart: false do |target|
    target.vm.box = 'Sliim/vulnhub-skydog-ctf'
    target.vm.box_download_checksum_type = 'sha256'
    target.vm.box_download_checksum = '4985ccc2fe664ee3058a1881f6a642d2'\
                                      '20ce46ae5d84601273908eea8ef7bf2d'
    target.vm.boot_timeout = 10

    target.vm.provider 'virtualbox' do |v|
      v.gui = false
      v.customize ['modifyvm', :id, '--name', 'pentest-env-skydog-ctf']
      v.customize ['modifyvm', :id, '--memory', 512]
    end
  end
end
