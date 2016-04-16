# This source file is part of pentest-env.
#
# pentest-env is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pentest-env is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with pentest-env. If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.

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
