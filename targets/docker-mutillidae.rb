# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'docker-mutillidae', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'szsecurity/mutillidae'
      d.name = 'pentest-env-mutillidae'
      d.ports = ['13374:80']
    end
  end
end
