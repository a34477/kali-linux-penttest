# -*- coding: utf-8 -*-
name 'pentestenv'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'GPL v3'
description 'pentest-env cookbook'
long_description 'Pentest-env specific configuration'
version '1.1.0'

recipe 'moombot::default', 'Default recipe, do nothing'
recipe 'moombot::whonix', 'Configure with Whonix Gateway'

depends 'network_interfaces'
depends 'resolver'
