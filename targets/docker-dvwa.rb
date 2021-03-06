# -*- coding: utf-8 -*-

def target(vconfig, _custom)
  vconfig.vm.define 'docker-dvwa', autostart: false do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'citizenstig/dvwa'
      d.name = 'pentest-env-dvwa'
      d.ports = ['13371:80']
    end
  end
end
