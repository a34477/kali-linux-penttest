# -*- coding: utf-8 -*-

node['pentestenv']['cscan']['packages'].each do |p|
  package p
end

cscan = node['pentestenv']['cscan']
faraday_cscan 'pentest-env' do
  action %i[install configure]
  path '/root'
  ips cscan['ips']
  websites cscan['websites']
  user 'root'
  group 'root'
  git_repository 'https://github.com/Sliim/cscan.git'
  git_reference 'msfrpc'
  config cscan['config']
end
