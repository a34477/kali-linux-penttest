# Pentest Environment Deployer

This repo provides an easy way to deploy a clean pentesting environment with Kali linux using vagrant and virtualbox.

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
| [Kali 2016.2](http://box.hackbbs.org/kali-2016.2.box) | 4c04e28c4fb7b6601cb838fba753af4cffb3ea2f0a9aa4c13f834cabd7e353cb |
| [Kali 2016.2-light](http://box.hackbbs.org/kali-2016.2-light.box) | 5d455bf1cf8d7b2b4f3be7c4b3cc43152ae5cfe09eaf4aaf30ac112aa6bd3b40 |
| [Kali 2016.2-lxde](http://box.hackbbs.org/kali-2016.2-lxde.box) | d7d534c329d43b6df9b294eeb558f8346b20d9334ef037f4c0360ed2acfeaab6 |
| [Kali 2016.2-xfce](http://box.hackbbs.org/kali-2016.2-xfce.box) | 5342e85587b64fc0fd58b54a07fd97264040ec3027106807b434bd6fbb80b7b6 |
| [Kali 2016.2-mate](http://box.hackbbs.org/kali-2016.2-mate.box) | f8a18c0a3f0cd6ed8c689dfebb04fc8d2a0018dc38effc1e67372787d9aa67b3 |
| [Kali 2016.2-e17](http://box.hackbbs.org/kali-2016.2-e17.box) | f5c06a16a34982fd107c0fce9ee42f3fe31d42636a7a551e08f4dc4dd7f275da |


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
metasploitable            not created (virtualbox)
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
10. [About boxes](docs/About-boxes.md)  
11. [Known issues](docs/Known-issues.md)  

## About Security
#### verify checksums
It's recommended to check downloaded box files with provided checksums (SHA256): http://box.hackbbs.org/checksums.txt
#### sshd is running
Provided boxes run the `sshd` service.
So if you plan to run the Kali linux with a Bridged interface, default setup can be dangerous!

- `root` password of kali is `toor`.
- SSH private key is not private! Anyone can use this [key](https://github.com/Sliim/pentest-env/blob/master/ssh-keys/pentest-env) to connect to your instance.
- The Kali linux 1.0 box added a `vagrant` user with password `tnargav` and is in sudoers with no password required.

## License
   See COPYING file
