# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'docker-webgoat', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'szsecurity/webgoat'
      d.name = 'pentest-env-webgoat'
      d.ports = ['13375:80']
    end
  end
end
