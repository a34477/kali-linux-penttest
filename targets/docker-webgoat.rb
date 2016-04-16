# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :webgoat do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'szsecurity/webgoat'
      d.ports = ['1337:80']
      d.name = 'pentest-env-webgoat'
    end
  end
end
