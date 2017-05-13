class profiles::confs::hadoop::standalone (
  $version,
){
  
  class { '::profiles::apps::hadoop::base':
    version                 => $version,
    primary_namenode        => $::fqdn,
    datanodes               => [ $::fqdn ],
    primary_resourcemanager => $::fqdn,
    nodemanager_nodes       => [ $::fqdn ],
    historyserver           => $::fqdn,
    timelineserver          => $::fqdn,

  }
}
