# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :bricks do |target|
   target.vm.provider 'docker' do |d|
     d.image = 'citizenstig/owaspbricks'
     d.ports = ['8888:80']
     d.name = 'pentest-env-bricks'
   end
  end
end
