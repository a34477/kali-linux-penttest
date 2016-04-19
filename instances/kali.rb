# -*- coding: utf-8 -*-

def instance(vconfig)
  vconfig.vm.define :kali, primary: true do |kali|
    kali.ssh.private_key_path = 'ssh-keys/pentest-env'
    kali.ssh.username =  'root'

    kali.vm.box = 'kali-2016.1'
    kali.vm.box_url = 'http://box.hackbbs.org/kali-2016.1.1-netfix.box'
    kali.vm.box_download_checksum_type = 'sha256'
    kali.vm.box_download_checksum = 'c652a76feca465f872c49442d780d332'\
                                    'ec10aba3047950d8a3de95183ec8af6c'

    kali.vm.guest = :debian

    # kali.vm.network :private_network, adapter: 2, type: 'dhcp'
    # kali.vm.network :public_network, adapter: 3, type: 'dhcp', bridge: 'wlan0'

    kali.vm.provider 'virtualbox' do |v|
      v.gui = true
      v.customize ['modifyvm', :id, '--name', 'pentest-env-kali-rolling']
      v.customize ['modifyvm', :id, '--memory', 2048]
    end
  end
end
