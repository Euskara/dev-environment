require 'spec_helper'

describe 'roles::sensu::standalone' do

  let(:environment) { 'sensu' }
  let(:hiera_config) { 'spec/fixtures/hiera/hiera.yaml' }
  let(:facts) do
    {
      operatingsystemmajrelease: '7',
      osfamily: 'RedHat',
      operatingsystem: 'CentOS',
      ipaddress_enp0s8: '172.16.0.10',
      ipaddress: '172.16.0.10',
      kernel: 'Linux',
      os: { 
        family: 'RedHat',
        release: {
          major: '7',
        }
      }
    }
  end

  it { is_expected.to contain_class('profiles::confs::rabbitmq::standalone')
       .with(:ensure => '3.6.12-1.el7', :erlang_ensure => 'R16B-03.18.el7') 
  }

  describe 'profiles:confs::rabbitmq::standalone' do
    
    it { is_expected.to contain_class('profiles::utils::erlang')
         .with(:ensure => 'R16B-03.18.el7')
    }

    describe 'profiles::utils::erlang' do

      it { is_expected.to contain_class('epel') }

      it { is_expected.to contain_package('erlang')
           .with(:ensure => 'R16B-03.18.el7')
           .that_requires('Class[epel]')
      }

    end

    describe 'profiles::apps::rabbitmq:base' do

      it { is_expected.to contain_class('rabbitmq')
           .with(:package_ensure =>'3.6.12-1.el7',
                 :repos_ensure => true,
                 :service_manage => true,
                 :management_ip_address => '172.16.0.10',
                 :delete_guest_user => true)
      }

    end

    it { is_expected.to contain_class('profiles::apps::rabbitmq::base')
         .with(:ensure => '3.6.12-1.el7')
         .that_requires('Class[Profiles::Utils::Erlang]')
    }

    it { is_expected.to contain_rabbitmq_user('vagrant')
         .with(:admin => true, :password => 'vagrant')
    }

    it { is_expected.to contain_rabbitmq_user('sensu')
         .with(:password => 'sensu')
    }

    it { is_expected.to contain_rabbitmq_vhost('sensu')
         .with(:ensure => 'present')
    }

    it { is_expected.to contain_rabbitmq_user_permissions('vagrant@/')
         .with(:configure_permission => '.*', :read_permission => '.*', :write_permission =>'.*')
    }

    it { is_expected.to contain_rabbitmq_user_permissions('vagrant@sensu')
         .with(:configure_permission =>'.*', :read_permission => '.*', :write_permission => '.*')
    }

    it { is_expected.to contain_rabbitmq_user_permissions('sensu@sensu')
         .with(:configure_permission => '.*', :read_permission => '.*', :write_permission => '.*')
    }

  end

  it { is_expected.to contain_class('profiles::confs::redis::standalone') }
  
  describe 'profiles::confs::redis::standalone' do

    it { is_expected.to contain_class('profiles::apps::redis::base') }

    describe 'profiles::apps::redis::base' do

      it { is_expected.to contain_class('redis')
           .with(:bind => '172.16.0.10')
      }

    end

  end

  it { is_expected.to contain_class('profiles::confs::sensu::standalone') }

  describe 'profiles::confs::sensu::standalone' do

    it { is_expected.to contain_class('profiles::apps::sensu::base') }

    describe 'profiles::apps::sensu::base' do

      it { is_expected.to contain_class('sensu')
           .with(
             :server            => true,
             :api               => true,
             :rabbitmq_host     => '172.16.0.10',
             :rabbitmq_user     => 'sensu',
             :rabbitmq_password => 'sensu',
             :rabbitmq_vhost    => 'sensu',
             :redis_host        => '172.16.0.10'
           )
      }

    end

    it { is_expected.to contain_class('profiles::apps::sensu::extensions::sensu_influxdb_extension') }

    describe 'profiles::apps::sensu::extensions::sensu_influxdb_extension' do

      it { is_expected.to contain_sensu__plugin('sensu-extensions-influxdb')
           .with(
             :type         => 'package',
             :pkg_version  => '2.1.0',
             :pkg_provider => 'sensu_gem',
           )
      }

      it { is_expected.to contain_file('/etc/sensu/extensions/influxdb.rb')
           .with(
             :ensure => 'link',
             :target => '/opt/sensu/embedded/lib/ruby/gems/2.4.0/gems/sensu-extensions-influxdb-2.1.0/lib/sensu/extensions/influxdb.rb',
             :owner  => 'sensu',
             :group  => 'sensu'
           )
      }

      it { is_expected.to contain_sensu__write_json('/etc/sensu/conf.d/influxdb-extension.json')
           .with(:content => { 'influxdb-extension' => { 'hostname' => '172.16.0.10', 'database' => 'sensu' } } )
      }

    end

    it { is_expected.to contain_class('profiles::apps::sensu::handlers::influxdb') }

    describe 'profiles::apps::sensu::handlers::influxdb' do

      it { is_expected.to contain_sensu__handler('metrics')
           .with(
             :type     => 'set',
             :handlers => [ 'influxdb-extension' ]
           )
      }
    end

    it { is_expected.to contain_class('profiles::apps::sensu::plugins::sensu_plugins_disk_checks') }

    describe 'profiles::apps::sensu::plugins::sensu_plugins_disk_checks' do

      it { is_expected.to contain_sensu__plugin('sensu-plugins-disk-checks')
           .with(
             :type         => 'package',
             :pkg_provider => 'sensu_gem'
           )
      }

    end

    it { is_expected.to contain_class('profiles::apps::sensu::metrics::disk_capacity') }

    describe 'profiles::apps::sensu::metrics::disk_capacity' do

      it { is_expected.to contain_sensu__check('metrics_disk_capacity')
           .with(
             :type     => 'metric',
             :command  => '/opt/sensu/embedded/bin/ruby /opt/sensu/embedded/bin/metrics-disk-capacity.rb',
             :handlers => [ 'metrics' ]
           )
      }

    end

  end

  it { is_expected.to contain_class('profiles::confs::uchiwa::standalone') }

  describe 'profiles::confs::uchiwa::standalone' do

    it { is_expected.to contain_class('profiles::apps::uchiwa::base') }

    describe 'profiles::apps::uchiwa::base' do

      it { is_expected.to contain_class('uchiwa')
           .with(:host => '172.16.0.10')
      }

    end

  end

end

