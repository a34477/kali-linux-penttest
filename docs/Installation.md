# Pentest-env Installation

Pentest-env works with Vagrant and Virtualbox. For installation instructions see:
- Vagrant: https://www.vagrantup.com/downloads.html
- Virtuabox: https://www.virtualbox.org/wiki/Downloads

Clone pentest-env repository and its submodules:
```
git clone https://github.com/Sliim/pentest-env.git
cd pentest-env/
git submodule init
git submodule update
```
Or in one line:
```
git clone https://github.com/Sliim/pentest-env.git --recursive
```

## Chef provisioning
You will need `rake` and `berkshelf` for Chef provisionning, you can install it with rubygems:
```
gem install rake berkshelf --no-ri --no-rdoc
```

To install cookbooks dependencies:
```
rake
```

## Docker provider
To use Docker as a provider for pentest-env, you will need `docker` installed on your host:

- Docker: https://docs.docker.com/

## Openstack provider
Openstack cloud provider can be used to deploy vms, Vagrant needs a plugin to interact with Openstack API:
```
vagrant plugin install vagrant-openstack-provider
```
For more details see the project page: https://github.com/ggiamarchi/vagrant-openstack-provider
