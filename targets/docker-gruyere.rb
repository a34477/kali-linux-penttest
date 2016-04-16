# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :gruyere do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'tomdesinto/gruyere'
      d.ports = ['8008:8008']
      d.name = 'pentest-env-gruyere'
    end
  end
end
