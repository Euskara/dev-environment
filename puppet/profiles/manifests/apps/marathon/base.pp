class profiles::apps::marathon::base (

  $version,
  $zookeeper,

)
{

  $zookeeper_servers = join( $zookeeper, ':2181,')
  class { '::marathon':
    repo_manage    => false,
    package_ensure => $version,
    zookeeper      => "zk://${zookeeper_servers}:2181/marathon",
    master         => "zk://${zookeeper_servers}:2181/mesos",
    options        => {
      hostname         => $::fqdn,
      event_subscriber => 'http_callback',
    },
  }

}
