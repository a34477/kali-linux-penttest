# -*- coding: utf-8 -*-

require 'rbconfig'
require 'yaml'
require File.expand_path('lib/pentestenv/customization')

rc = {}
rc_filename = '.pentestrc'

if ENV['PENTESTRC'] && File.exist?(ENV['PENTESTRC'])
  rc = ENV['PENTESTRC']
elsif File.exist?("#{ENV['PWD']}/#{rc_filename}")
  rc = "#{ENV['PWD']}/#{rc_filename}"
elsif File.exist?("#{ENV['HOME']}/#{rc_filename}")
  rc = "#{ENV['HOME']}/#{rc_filename}"
end

customization = Pentestenv::Customization.new(YAML.load(File.read(rc)))
Vagrant::configure('2') do |config|
  config.ssh.forward_agent = true
  customization.register config, 'instances'
  customization.register config, 'targets'
end
