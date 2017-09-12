# -*- mode: ruby -*-
# # vi: set ft=ruby :
 
# Specify minimum Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require YAML module
require 'yaml'
BASE   = YAML.load(File.read("#{File.dirname(__FILE__)}/config/base.yaml"))
CONFIG = YAML.load(File.read("#{File.dirname(__FILE__)}/config/#{ENV['YAML']}.yaml"))

#manage plugins
BASE['plugins'].each do |plugin, version|
  system "vagrant plugin install #{plugin} --plugin-version #{version}" unless Vagrant.has_plugin?(plugin,version)
end

boxes = {
  'centos73' => 'bento/centos-7.3',
  'ubuntu16' => 'ubuntu/xenial64',
  'win2012r2' => 'opentable/win-2012r2-standard-amd64-nocm'
  }
windows = ['win2012r2']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  $ipCount = 10
#manage virtual box guest tools:
  config.vbguest.auto_update = BASE['vbguest']['enable'] || false

#manage librarian-puppet:
  if BASE['puppet']['enable']
    config.librarian_puppet.puppetfile_dir = BASE['puppet']['puppet_dir']
  end

#manage dns resolution:
  config.hostmanager.enabled = BASE['hostmanager']['enable'] || false
  config.hostmanager.manage_host = BASE['hostmanager']['manage_host'] || false
  config.hostmanager.manage_guest = BASE['hostmanager']['manage_guest'] || false

#manage machines:
  CONFIG['roles'].each do |role, conf|
    (1..conf['count']).each do |count|
      config.vm.define "#{role}-#{conf['environment']}-#{count}" do |machine|
        $ipCount = $ipCount + 1
        machine.vm.box = BASE['boxes'][conf['os']]
	if windows.include?(conf['os'])
	  machine.vm.hostname = "#{role}-#{conf['environment']}-#{count}"
	else
          machine.vm.hostname = "#{role}-#{conf['environment']}-#{count}.vagrant.local"
	end
        machine.hostmanager.aliases = [ "#{role}-#{conf['environment']}-#{count}.vagrant.local.",  "#{role}-#{conf['environment']}-#{count}" ]
        machine.vm.network "private_network", ip: "172.16.0.#{$ipCount}"
        machine.vm.synced_folder '.', '/vagrant', disabled: true

        #manage machine resources:
        machine.vm.provider :virtualbox do |vb|
	  if windows.include?(conf['os'])
	    vb.gui  = true
	    vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
	    vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
	    vb.customize ['modifyvm', :id, '--vram', '12']
	  end
          vb.name = "#{role}-#{conf['environment']}-#{count}.vagrant.local"
          vb.memory = conf['memory']
          vb.cpus   = conf['cpu']
	end

        #install puppet
	if BASE['puppet']['enable'] and windows.include?(conf['os'])
	  machine.vm.provision "shell", path: "scripts/installPuppet.ps1"
	else
	  machine.puppet_install.puppet_version = BASE['puppet']['version'] || :latest
	end

	#manage puppet:
        if BASE['puppet']['enable']
          machine.vm.synced_folder "#{BASE['puppet']['puppet_dir']}/hiera", '/hiera'
          machine.vm.provision :puppet do |puppet|
            puppet.hiera_config_path = "#{BASE['puppet']['puppet_dir']}/hiera.yaml"
            puppet.environment_path = "#{BASE['puppet']['puppet_dir']}/environments"
            puppet.environment = conf['environment']
            puppet.module_path = "#{BASE['puppet']['puppet_dir']}/modules"
          end
        end
        if conf['data']['enable']
          machine.persistent_storage.enabled = BASE['persistent-storage']['enable'] || false
          machine.persistent_storage.location = "datadisks/#{role}-#{count}-#{conf['environment']}.vdi"
          machine.persistent_storage.size = conf['data']['size'] || 5000
          machine.persistent_storage.mountname = 'data'
          machine.persistent_storage.filesystem = conf['data']['filesystem'] || 'ext4'
          machine.persistent_storage.mountpoint = conf['data']['mountpoint'] || '/data'
        end
      end
    end
  end

end
