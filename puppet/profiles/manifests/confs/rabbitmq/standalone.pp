class profiles::confs::rabbitmq::standalone (
  $ensure,
  $erlang_ensure,

){

  class { 'profiles::utils::erlang':
    ensure => $erlang_ensure,
  }
  class { 'profiles::apps::rabbitmq::base':
    ensure  => $ensure,
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
  rabbitmq_user_permissions { 'vagrant@/':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }
  rabbitmq_user_permissions { 'vagrant@/sensu':
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }
  rabbitmq_user_permissions { 'sensu@/sensu':
    configure_permission =>  '.*',
    read_permission      =>  '.*',
    write_permission     =>  '.*',
  }

}
