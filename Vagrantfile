# -*- coding: utf-8 -*-

require 'rbconfig'
require 'yaml'
require File.expand_path('lib/pentestenv/customization')

rc = "#{ENV['HOME']}/.pentestrc"
customization = Pentestenv::Customization.new(
  File.exist?(rc) ? YAML.load(File.read(rc)) : {})

Vagrant::configure('2') do |config|
  config.ssh.forward_agent = true
  customization.instances config
  customization.targets config
end
