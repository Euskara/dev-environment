class profiles::confs::rabbitmq::standalone {

  class { 'profiles::utils::erlang': }
  class { 'profiles::apps::rabbitmq::base':
    require => Class[ 'profiles::utils::erlang' ]
  }
  rabbitmq_user { 'vagrant':
    admin    =>  true,
    password =>  'vagrant',
  }
  rabbitmq_user { 'sensu':
    password => 'sensu',
  }
  rabbitmq_vhost { '/sensu':
    ensure => present,
  }
  rabbitmq_user_permissions { 'sensu@/sensu':
    configure_permission =>  '.*',
    read_permission      =>  '.*',
    write_permission     =>  '.*',
  }

}
