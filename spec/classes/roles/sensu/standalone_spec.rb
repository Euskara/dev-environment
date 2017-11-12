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

    it { is_expected.to contain_rabbitmq_vhost('/sensu')
         .with(:ensure => true)
    }

    it { is_expected.to contain_rabbitmq_user_permissions('vagrant@/')
         .with(:configure_permission => '.*', :read_permission => '.*', :write_permission =>'.*')
    }

    it { is_expected.to contain_rabbitmq_user_permissions('vagrant@/sensu')
         .with(:configure_permission =>'.*', :read_permission => '.*', :write_permission => '.*')
    }

  end

  it { is_expected.to contain_class('profiles::confs::redis::standalone') }
  it { is_expected.to contain_class('profiles::confs::sensu::standalone') }
  it { is_expected.to contain_class('profiles::confs::uchiwa::standalone') }

end

