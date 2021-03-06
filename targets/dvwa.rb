# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :dvwa, autostart: false do |target|
    target.vm.box = 'ubuntu/precise32'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-dvwa']
      v.customize ['modifyvm', :id, '--memory', 256]
    end

    target.vm.provision :chef_solo do |chef|
      chef.json = {
        'dvwa' => {
          'db' => {
            'use_psql' => false
          }
        }
      }
      chef.add_recipe('dvwa')
    end
  end
end
