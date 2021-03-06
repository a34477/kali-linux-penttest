# -*- coding: utf-8 -*-

default['pentestenv']['nat']['interface'] = 'eth0'
default['pentestenv']['nat']['gateway'] = '10.0.2.2'
default['pentestenv']['whonix']['interface'] = 'eth1'
default['pentestenv']['whonix']['gateway'] = '10.152.152.10'
default['pentestenv']['whonix']['address'] = '10.152.152.11'
default['pentestenv']['whonix']['netmask'] = '255.255.192.0'

default['pentestenv']['cscan']['ips'] = []
default['pentestenv']['cscan']['websites'] = []
default['pentestenv']['cscan']['config'] = {}
default['pentestenv']['cscan']['packages'] = ['python-msgpack', 'python-pip']

default['pentestenv']['msf_workspace'] = 'default'
default['pentestenv']['authorized_keys'] = {}
