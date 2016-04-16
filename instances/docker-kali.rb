# -*- coding: utf-8 -*-

def instance(vconfig)
  vconfig.vm.define :kali do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username =  'root'
    kali.vm.provider 'docker' do |d|
      d.build_dir = 'instances'
      d.build_args = ['-t', 'pentest-env/kali']
      d.dockerfile = 'dockerfiles/kali'
      d.has_ssh = true
    end
  end
end
