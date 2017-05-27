class profiles::confs::zookeeper::standalone (

  $id,
  $servers,

)
{

  class { '::profiles::apps::zookeeper::base':
    id      => $id,
    servers => $servers,
  }
}

