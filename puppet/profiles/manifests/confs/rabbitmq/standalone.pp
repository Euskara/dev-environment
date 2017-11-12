class profiles::confs::rabbitmq::standalone (

  $ensure,
  $erlang_ensure,
  $users,
  $vhosts,
  $user_permissions,

){

  class { 'profiles::utils::erlang':
    ensure => $erlang_ensure,
  }

  class { 'profiles::apps::rabbitmq::base':
    ensure  => $ensure,
    require => Class[ 'profiles::utils::erlang' ]
  }

  ensure_resources('rabbitmq_user', $users)
  ensure_resources('rabbitmq_vhost', $vhosts)
  ensure_resources('rabbitmq_user_permissions', $user_permissions)

}
