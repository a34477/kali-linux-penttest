# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define 'docker-bricks', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'citizenstig/owaspbricks'
      d.ports = ['8888:80']
      d.name = 'pentest-env-bricks'
    end
  end
end
