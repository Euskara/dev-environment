require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper

RSpec.configure do |c|
  
  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      scp_to host, File.expand_path(File.join(File.dirname(__FILE__), '../puppet', 'profiles')), '/etc/puppetlabs/code/modules/profiles'
      scp_to host, File.expand_path(File.join(File.dirname(__FILE__), '../puppet', 'roles')), '/etc/puppetlabs/code/modules/roles'
      scp_to host, File.expand_path(File.join(File.dirname(__FILE__), '../puppet', 'hiera')), '/etc/puppetlabs/puppet/hiera'
      scp_to host, File.expand_path(File.join(File.dirname(__FILE__), 'acceptance', 'hiera.yaml')), '/etc/puppetlabs/puppet/hiera.yaml'
      on host, puppet('module install puppetlabs-stdlib')
      on host, puppet('module install puppet-rabbitmq')
    end
  end
end


