# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define :gruyere, autostart: false do |target|
    target.vm.box = 'ubuntu/precise32'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-gruyere']
      v.customize ['modifyvm', :id, '--memory', 256]
    end

    target.vm.provision :chef_solo do |chef|
      chef.add_recipe('gruyere::apache2_proxy')
    end
  end
end
