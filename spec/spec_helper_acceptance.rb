require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

run_puppet_install_helper

RSpec.configure do |c|
  
  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      on host, puppet('module install puppetlabs-stdlib')
      on host, puppet('module install puppet-rabbitmq')
    end
  end
end


