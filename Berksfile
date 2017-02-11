# -*- coding: utf-8 -*-
source 'https://supermarket.getchef.com'

cookbook 'pentestenv', path: 'cookbook/'
cookbook 'network_interfaces',
         git: 'https://github.com/sliim-cookbooks/network_interfaces',
         branch: 'fixes'

cookbook 'apache2'
cookbook 'apt'
cookbook 'aws'
cookbook 'build-essential'
cookbook 'database'
cookbook 'mysql'
cookbook 'openssl'
cookbook 'php'
cookbook 'postgresql'
cookbook 'xfs'
cookbook 'xml'
cookbook 'hostname'
cookbook 'elite'

# Wargames cookbooks
cookbook 'dvwa'
cookbook 'gruyere'
cookbook 'bricks'
cookbook 'webgoat'
cookbook 'vicnum'

# Pentest chef repo
cookbook 'kali'
cookbook 'tor-full'
cookbook 'proxychains'
cookbook 'faraday'
cookbook 'couchdb', git: 'https://github.com/sliim-cookbooks/couchdb-cookbook'
cookbook 'beef'
cookbook 'pentester'

cookbook 'nessus'
cookbook 'nexpose'

custom_berks = 'Berksfile.custom'
eval(IO.read(custom_berks), binding) if File.exist?(custom_berks)
