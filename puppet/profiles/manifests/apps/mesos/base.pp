class profiles::apps::mesos::base (

  $version,
  $zookeeper,

)
{
  class { '::mesos':
    repo           => 'mesosphere',
    version        => $version,
    zookeeper      => $zookeeper,
    listen_address => $::ipaddress_enp0s8,
  }
}
