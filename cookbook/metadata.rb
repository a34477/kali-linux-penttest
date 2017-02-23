# -*- coding: utf-8 -*-
name 'pentestenv'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'GPL v3'
description 'pentest-env cookbook'
long_description 'Pentest-env specific configuration'
version '1.1.0'

recipe 'pentestenv::default', 'Default recipe, do nothing'
recipe 'pentestenv::whonix', 'Configure with Whonix Gateway'
recipe 'pentestenv::cscan', 'Configure continuous scanning'
recipe 'pentestenv::faraday_metasploiton_plugin', 'Configure faraday with msf'
recipe 'pentestenv::authorized_keys', 'Set users authorized keys'

depends 'network_interfaces'
depends 'resolver'
depends 'ssh_authorized_keys'
