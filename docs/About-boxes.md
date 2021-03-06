# About boxes

All `pentest-env` boxes are located at https://atlas.hashicorp.com/Sliim

Be sure to compare the checksum after your download, you can find latest generated SHA256 sums [here](https://raw.githubusercontent.com/Sliim/pentest-env/master/checksums.txt), or in the root directory of this repository.

### Kali 2016.2
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: 4c04e28c4fb7b6601cb838fba753af4cffb3ea2f0a9aa4c13f834cabd7e353cb
- VirtualBox: 5.0.24
- Vagrant: 1.8.5

##### Other builds
###### Light
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-light-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: 5d455bf1cf8d7b2b4f3be7c4b3cc43152ae5cfe09eaf4aaf30ac112aa6bd3b40

###### LXDE
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-lxde-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: d7d534c329d43b6df9b294eeb558f8346b20d9334ef037f4c0360ed2acfeaab6

###### Xfce
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-xfce-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: 4b597aa7ad31179ecad882e80074945155e0017fb465db6474e553f58728486e

###### Mate
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-mate-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: 5f1e06f18714d78dc0310f188bb0a10283c5d257e3d640c1399fa556fe681355

###### Enlightenment
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-e17-amd64/versions/2016.2.1/providers/virtualbox.box
- SHA256: 980c7402bbb8f7c3adafb0544db8430addda4c68918c1756ac031ab333faf66b

##### Changes
Fresh install from Kali linux ISO images
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `ssh` services at boot.
- Workaround for additional network interfaces

I used this [script](https://gist.github.com/Sliim/f4b7ae150c4999a4241236ab9fbfb256) to automate these changes on all Kali 2016.2 boxes.

### Cyborg essentials v1
- URL: https://atlas.hashicorp.com/Sliim/boxes/cyborg-essentials/versions/1/providers/virtualbox.box
- SHA256: d15384c2e10b8ede2893b045399e959f87fbf5ed8b152c7fd9f6bbc84fa8e33f
- VirtualBox: 5.0.16
- Vagrant: 1.8.1

##### Changes
Fresh install from http://cyborg.ztrela.com/cyborg-essentials/
- Installation of VirtualBox guest additions
- Add pentest-env pubkey in authorized keys for root user
- Comment cdrom media in apt sources

### Kali linux 2016.1
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-2016.1-amd64/versions/2016.1.2/providers/virtualbox.box
- SHA256: c652a76feca465f872c49442d780d332ec10aba3047950d8a3de95183ec8af6c
- VirtualBox: 5.0.14
- Vagrant: 1.8.1

##### Changes
Fresh install from http://cdimage.kali.org/kali-2016.1/kali-linux-2016.1-amd64.iso
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `ssh` services at boot.
- Added interfaces in `/etc/network/interfaces`:
```
auto eth1
iface eth1 inet dhcp
auto eth2
iface eth2 inet dhcp
```

### Kali linux 2.0 light
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-linux-2.0-light-amd64/versions/2.0.1/providers/virtualbox.box
- SHA256: 46424ee6650fab00aeb4e52506ab7ea2851d47779f834e86acaee0a05cecdecf
- VirtualBox: 4.3.30
- Vagrant: 1.7.4

##### Changes
Fresh install from http://cdimage.kali.org/kali-2.0/kali-linux-light-2.0-amd64.iso
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `rpcbind` and `ssh` services at boot.

### Kali linux 2.0
- URL: https://atlas.hashicorp.com/Sliim/boxes/kali-linux-2.0-amd64/versions/2.0.1/providers/virtualbox.box
- SHA256: 256d2ae5d80967ac407be7bdb79358c99817d3ee9f147ff7afaa66aac4ce029f
- VirtualBox: 4.3.30
- Vagrant: 1.7.4

##### Changes
Fresh install from http://cdimage.kali.org/kali-2.0/kali-linux-2.0-amd64.iso
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `rpcbind` and `ssh` services at boot.

### Old Boxes (unavailable)
#### Kali linux 1.1.0
- URL: http://box.hackbbs.org/kali-1.1.0-amd64-en-layout.box
- SHA256: b23eaa3bef29502a0460e092adbd5d9eed28ce75b502dc841c6c70b854acf4c2
- VirtualBox: 4.3.20
- Vagrant: 1.7.1

##### Changes
Fresh install from http://cdimage.kali.org/kali-1.1.0a/kali-linux-1.1.0a-amd64.iso
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `rpcbind`, `nfs-common` and `ssh` services at boot.
- Modified `/etc/issue` for vagrant os detection.
- MAC address for private network was added in `/etc/NetworkManager/NetworkManager.conf` to disable auto connect.

#### Kali linux 1.0.4
- URL: http://box.hackbbs.org/kali-linux-1.0.4-amd64.box
- SHA256: 3a0cb129fe4e8da9eedfe799025a22071ca1a9df463f66f57f61a7318a1abc4d
- VirtualBox: 4.2.16
- Vagrant: 1.2.7

##### Changes
Fresh install from http://cdimage.kali.org/kali-latest/amd64/kali-linux-1.0.4-amd64-mini.iso
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Installation of `chef` package for provisioning.
- Authorized keys for `root` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `rpcbind`, `nfs-common` and `ssh` services at boot.
- Modified `/etc/issue` for vagrant os detection.
- MAC address for private network was added in `/etc/NetworkManager/NetworkManager.conf` to disable auto connect.

#### Kali linux 1.0
- URL: http://box.hackbbs.org/kali-linux-1.0-amd64.box
- SHA256: 85c009ea32431f47ae46c54f1ea664d0c96e26f2365942ce40aff5dee44b82e8
- VirtualBox: 4.2.10
- Vagrant: 1.0.7

##### Changes
- Installation of linux kernel headers for vbox guest additions.
- Installation of virtualbox guest additions.
- Installation of `chef` package for provisioning.
- `vagrant` user was created for provisionning (Password: `tnargav`).
- `admin` group doesn’t require password for `sudo`.
- `vagrant` user is in `admin` group.
- Authorized keys for `vagrant` user are stored in `ssh-keys/` directory (no passphrase).
- Enabling `rpcbind`, `nfs-common` and `ssh` services at boot.
