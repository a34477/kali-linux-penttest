# -*- coding: utf-8 -*-

node.override['faraday']['config']['plugin_settings'] = {
  MetasploitOn: {
    settings: {
      Enable: '1',
      Server: node['pentester']['db']['host'],
      Database: node['pentester']['msf']['db']['db'],
      Port: node['pentester']['db']['port'],
      User: node['pentester']['msf']['db']['user'],
      Password: node['pentester']['msf']['db']['pass'],
      Wordspace: node['pentestenv']['msf_workspace']
    },
    plugin_version: '0.0.3',
    name: 'Metasploit Online Service Plugin',
    version: 'Metasploit 4.10.0',
    description: ''
  }
}.to_json
