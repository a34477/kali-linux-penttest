# -*- coding: utf-8 -*-

interface = node['pentestenv']['whonix']['interface']

execute "sed -i 's/.*#{interface}.*//g' /etc/network/interfaces"

include_recipe 'network_interfaces'

network_interfaces interface do
  gateway node['pentestenv']['whonix']['gateway']
  target node['pentestenv']['whonix']['address']
  mask node['pentestenv']['whonix']['netmask']
end

# TODO: Use the route resource
execute 'ip route del default '\
        "via #{node['pentestenv']['nat']['gateway']} "\
        "dev #{node['pentestenv']['nat']['interface']}"

execute 'ip route add default '\
        "via #{node['pentestenv']['whonix']['gateway']} "\
        "dev #{interface}"
