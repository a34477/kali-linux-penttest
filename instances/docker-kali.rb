# -*- coding: utf-8 -*-

def instance(vconfig, _custom)
  vconfig.vm.define 'docker-kali' do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username = 'root'
    kali.ssh.sudo_command = '%c'
    kali.vm.provider 'docker' do |d|
      d.build_dir = '.'
      d.build_args = ['-t', 'pentest-env/kali']
      d.dockerfile = 'dockerfiles/kali'
      d.has_ssh = true
    end
  end
end
