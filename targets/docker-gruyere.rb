# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define 'docker-gruyere', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'tomdesinto/gruyere'
      d.name = 'pentest-env-gruyere'
      d.ports = ['13373:8008']
    end
  end
end
