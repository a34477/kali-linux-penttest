def target(vconfig)
  vconfig.vm.define :dvwa do |target|
    target.vm.provider 'docker' do |d|
      d.image = 'citizenstig/dvwa'
      d.ports = ['8080:80']
      d.name = 'pentest-env-dvwa'
    end
  end
end
