class profiles::apps::zookeeper::base (

  $id,
  $servers,

)
{

  class { '::zookeeper':
    client_ip            => $::ipaddress_enp0s8,
    id                   => $id,
    servers              => $servers,
    repo                 => 'cloudera',
    cdhver               => '5',
    packages             => [ 'zookeeper', 'zookeeper-server'],
    service_name         => 'zookeeper-server',
    initialize_datastore => true
  }
}
