# Pentest-env customizations

You can customize your pentest environment with a `.pentestrc` file in YaML format.

This file can be located in different locations (by priority order):

1. `PENTESTRC` env var
2. `$PWD/.pentestrc` file
3. `$HOME/.pentestrc` file

You can specify a file with the environment variable `PENTESTRC`. 
This will use this file if exists instead the `.pentestrc` in the current working directory or the user's home directory.

`pentest-env` comes with some [examples](../examples/), you can use, copy, modify for your needs.
For example to use the `wargames` example:
```
> cat examples/wargames.pentestrc
instances:
  - kali

targets:
  - bricks
  - gruyere
  - webgoat
  - dvwa
  - vicnum

kali:
  packages: [kali-linux-web]
  networks:
    - private_network:
        adapter: 2
        type: dhcp
  vbox:
    customize:
      memory: 4096

dvwa:
  autostart: true
```

Status:
```
> PENTESTRC=examples/wargames.pentestrc vagrant status 
Current machine states:

kali                      not created (virtualbox)
bricks                    not created (virtualbox)
gruyere                   not created (virtualbox)
webgoat                   not created (virtualbox)
dvwa                      not created (virtualbox)
vicnum                    not created (virtualbox)
```

### Setup your Instances an Targets

The basic customization is to set up your instances and targets list, this is done by:
```
instances:
  - kali
  - docker-kali
  - cyborg
  
targets:
  - metasploitable2
  - dvwa
```

### Customizations

Instances and Targets are customizable, here is the different elements you can customize:

##### autostart
By default `kali` is the privary vm, and only this instance will start with `vagrant up` command.
If you want `autostart` another vm you can do:
```
kali:
  autostart: false
  
cyborg:
  autostart: true
```

##### ssh
Change the way vagrant is connecting to your instance by configuring `ssh`:
```
kali:
  ssh: 
    username: woot
    private_key_path: ssh-keys/custom
```

##### packages
You can install additional packages by:
```
kali:
  packages: 
    - kali-linux-forensic
    - kali-linux-sdr
```

APT packages only! Use `commands` or `scripts` for another package managers.

##### commands
To run commands:
```
docker-kali:
  commands: 
    - apt-get update
    - apt-get install -y metasploit-framework
```

##### scripts
You can store some scripts in a directory, and use them to provision your machine:
```
scripts_path: ~/.pentest.d/scripts

kali:
  scripts: 
    - pentestlab.sh
```

##### volumes
Set up some volumes:
```
kali:
  volumes:
    /local/path/msf: /root/.msf4
```

##### networks
Set up some networks:
```
kali:
  networks:
    - public_network:
        adapter: 2
        bridge: eth0
        type: dhcp
    - private_network:
        adapter: 3
        ip: 172.37.13.0/24
    - private_network:
        adapter: 4
        ip: 10.13.37.0/24
```

### Providers customizations

It is also possible to customize or override configuration for some providers:

##### Virtualbox
To customize Virtualbox provider, use the `vbox` key:
```
kali:
  vbox:
    gui: false
    cpus: 2
    memory: 8192
```

This also works:
```
kali:
  vbox:
    customize:
      cpus: 2
      memory: 8192
```

See Vagrant documentation for [Virtualbox configuration](https://www.vagrantup.com/docs/virtualbox/configuration.html) to have a complete list of configuration variables.

##### Docker
For Docker, use the `docker` key:
```
docker-kali:
  docker:
    ports: ["3000:3000", "8080:80"]

```

See Vagrant documentation for [Docker configuration](https://www.vagrantup.com/docs/docker/configuration.html) to have a complete list of configuration variables.

##### Openstack
To customize Openstack, use the `openstack` key:
```
os-webgoat:
  openstack:
    flavor: m1.medium
    image: ubuntu-14.04-cloudimg
    floating_ip_pool: pool1
```

See the Vagrant plugin [project page](https://github.com/ggiamarchi/vagrant-openstack-provider) for more details about this plugin configuration.

### Provisioners customizations
You can customize provisioning of your machines.

##### Chef
`chef-solo` is used as the provisioner. You need to init git submodules to provision your instance with provided roles in pentest-chef-repo (See [installation instruction](Installation.md#chef-provisioning)). If this submodule is missing, Chef provisioning will be ignored.

You can configure following settings for Chef provisioning:
- recipes
- roles
- json attributes

To configure provisioning, use the `chef` key in your `pentestrc`:
```
kali:
  chef:
    recipes:
      - apt
      - kali
      - nessus
    roles:
      - kali-base
    json:
      nessus:
        installer_file: /vagrant/tools/Nessus-6.5.4-debian6_amd64.deb
        activation_code: XXXX-XXXX-XXXX-XXXX-XXXX

```

Note that if you want to use additional cookbooks, you can create a file called `Berksfile.custom` with your custom dependencies and execute the `rake` command to download new dependencies.

See [pentest-chef-repo](https://github.com/Sliim/pentest-chef-repo) for a detailed list of available roles.


### Custom Instances and Targets
You can create, copy, modify existing instances and targets. Put them in your `instances_path` and `targets_path` directories and you can use them in your `pentestrc`:

```
> ls -l ~/.pentest.d/{instances,targets}
~/.pentest.d/instances:
total 12
-rw-r--r-- 1 sliim sliim 243 Apr 30 01:31 docker-beef.rb
-rw-r--r-- 1 sliim sliim 217 Apr 30 01:41 docker-msf.rb
-rw-r--r-- 1 sliim sliim 603 Apr 25 19:55 kali-custom.rb

~/.pentest.d/targets:
total 100
-rw-r----- 1 sliim sliim 1083 Feb 17 13:37 vuln-server.rb
```

Then, in your `pentestrc`:
```
scripts_path: ~/.pentest.d/scripts
instances_path: ~/.pentest.d/instances
targets_path: ~/.pentest.d/targets

instances:
  - kali-custom
  - docker-beef
  - docker-msf

targets: 
  - vuln-server
```

See the document to [Write your own instances and targets](Custom-instances.md)
