# Pentest Environment Deployer | [![Build Status](https://travis-ci.org/Sliim/pentest-env.svg?branch=master)](https://travis-ci.org/Sliim/pentest-env) 

This repo provides an easy way to deploy a clean and customized pentesting environment with Kali linux using vagrant and virtualbox.

## Requirements
I assume you are familiar with virtualbox and vagrant.
- https://www.virtualbox.org/
- http://www.vagrantup.com/

Latest `pentest-env` release is tested with:
- Virtualbox (5.0.24)
- Vagrant (1.8.5)

## Current box
### Kali 2016.2
| Box               | SHA256                                                           |
|------------------ | -----------------------------------------------------------------|
| [Kali 2016.2](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-amd64) | `4c04e28c4fb7b6601cb838fba753af4cffb3ea2f0a9aa4c13f834cabd7e353cb` |
| [Kali 2016.2-light](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-light-amd64) | `5d455bf1cf8d7b2b4f3be7c4b3cc43152ae5cfe09eaf4aaf30ac112aa6bd3b40` |
| [Kali 2016.2-lxde](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-lxde-amd64) | `d7d534c329d43b6df9b294eeb558f8346b20d9334ef037f4c0360ed2acfeaab6` |
| [Kali 2016.2-xfce](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-xfce-amd64) | `4b597aa7ad31179ecad882e80074945155e0017fb465db6474e553f58728486e` |
| [Kali 2016.2-mate](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-mate-amd64) | `5f1e06f18714d78dc0310f188bb0a10283c5d257e3d640c1399fa556fe681355` |
| [Kali 2016.2-e17](https://atlas.hashicorp.com/Sliim/boxes/kali-2016.2-e17-amd64) | `980c7402bbb8f7c3adafb0544db8430addda4c68918c1756ac031ab333faf66b` |


See the [documentation](docs/About-boxes.md) page about boxes for more details.

## Getting started
To get started with `pentest-env`, clone this repository and run `vagrant up` inside the directory.
This will download and run the Kali instance.

You can customize, add targets, create new targets etc.. inside `pentest-env`.
Some examples are available in the `examples/` directory, to use one simply set the `PENTESTRC` environment variable:
```
> PENTESTRC=examples/ctf.pentestrc vagrant status
Current machine states:

kali                      running (virtualbox)
metasploitable2           not created (virtualbox)
primer                    not created (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

For more details, visit the [documentation](docs/) pages:

1. [Installation](docs/Installation.md)  
2. [Usage](docs/Usage.md)  
3. [Docker](docs/Docker.md)  
4. [Openstack](docs/Openstack.md)  
5. [Customizations](docs/Customizations.md)  
6. [Instances](docs/Instances.md)  
7. [Targets](docs/Targets.md)  
8. [Write custom instances and targets](docs/Custom-instances.md)  
9. [Debugging](docs/Debugging.md)  
9. [Security](docs/Security.md)  
10. [About boxes](docs/About-boxes.md)  
11. [Known issues](docs/Known-issues.md)  

Some configuration examples:  
1. [Configure Kali linux with Tor & proxychains](docs/examples/Tor-proxy.md)  
2. [Configure Kali linux with Whonix gateway](docs/examples/Whonix.md)  
3. [Faraday cscan against metasploitable 2 & 3 targets](docs/examples/Cscan-msfrpc.md)  
4. [Configure a Teamserver](docs/examples/Teamserver.md)  

## About Security
#### verify checksums
It's recommended to check downloaded box files with provided checksums (SHA256).  
See https://raw.githubusercontent.com/Sliim/pentest-env/master/checksums.txt for checksums list.
#### sshd is running
Provided boxes run the `sshd` service.  
So if you plan to run the Kali linux with a Bridged interface, default setup can be dangerous!

- `root` password of kali is `toor`.
- SSH private key is not private! Anyone can use this [key](https://github.com/Sliim/pentest-env/blob/master/ssh-keys/pentest-env) to connect to your instance.

See the [secure the environment](docs/Security.md) page to automatically change these defaults values.

## License
   See COPYING file
