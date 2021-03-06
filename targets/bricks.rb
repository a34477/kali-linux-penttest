# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :bricks, autostart: false do |target|
    target.vm.box = 'ubuntu/precise32'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-bricks']
      v.customize ['modifyvm', :id, '--memory', 256]
    end

    target.vm.provision :chef_solo do |chef|
      chef.json = {
        'bricks' => {
          'codename' => :tuivai
        }
      }
      chef.add_recipe('bricks')
    end
  end
end
