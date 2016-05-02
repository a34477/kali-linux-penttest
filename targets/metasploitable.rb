# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :metasploitable, autostart: false do |target|
    target.vm.box = 'pentestenv/metasploitable2'
    target.vm.box_url = 'http://box.hackbbs.org/metasploitable2.box'

    target.ssh.username = 'msfadmin'
    target.ssh.password = 'msfadmin'
    target.vm.synced_folder '.', '/vagrant', disabled: true

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-metasploitable']
      v.customize ['modifyvm', :id, '--memory', 256]
    end
  end
end
