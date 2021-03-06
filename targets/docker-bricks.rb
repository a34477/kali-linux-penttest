# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'docker-bricks', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'citizenstig/owaspbricks'
      d.name = 'pentest-env-bricks'
      d.ports = ['13372:80']
    end
  end
end
