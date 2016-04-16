# -*- coding: utf-8 -*-

def target(vconfig)
  vconfig.vm.define :mutillidae do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'szsecurity/mutillidae'
      d.ports = ['1338:80']
      d.name = 'pentest-env-mutillidae'
    end
  end
end
