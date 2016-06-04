# -*- coding: utf-8 -*-

interface = node['pentestenv']['whonix']['interface']

execute "sed -i 's/.*#{interface}.*//g' /etc/network/interfaces"

include_recipe 'network_interfaces'

network_interfaces interface do
  gateway node['pentestenv']['whonix']['gateway']
  target node['pentestenv']['whonix']['address']
  mask node['pentestenv']['whonix']['netmask']
end

# TODO: Should be better to use the route resource
execute 'route del default'
execute "route add default gw #{node['pentestenv']['whonix']['gateway']} dev #{interface}"
