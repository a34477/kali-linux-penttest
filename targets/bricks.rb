# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :bricks do |target|
    target.vm.box = 'opscode-ubuntu-12.04'
    target.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box'

    target.vm.provider 'virtualbox' do |v|
      v.customize ['modifyvm', :id, '--name', 'pentest-env-bricks']
    end

    target.vm.provision :chef_solo do |chef|
      chef.json = {
        'bricks' => {
          'codename' => :tuivai
        }
      }
      chef.add_recipe('bricks')
    end

    target.vm.network :private_network, type: 'dhcp'
  end
end
