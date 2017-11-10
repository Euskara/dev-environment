class profiles::apps::kafka::base (
  $version           = '0.11.0.1',
  $scala_version     = '2.12',
  $broker_id         = '0',
  $zookeeper_servers = "${::fqdn}:2181",
){

  class { 'kafka':
    version       => $version,
    scala_version => $scala_version,
    install_java  => false,
  }

  class { 'kafka::broker':
    config => {
      'broker.id'         => $broker_id,
      'zookeeper.connect' => $zookeeper_servers,
    },
  }

}
