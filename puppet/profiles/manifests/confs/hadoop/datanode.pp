class profiles::confs::hadoop::datanode (

  $version,
  $primary_namenode,
  $secondary_namenode = undef,
  $datanodes,
  $primary_resourcemanager,
  $secondary_resourcemanager = undef,
  $nodemanager_nodes,

){

  class { '::profiles::apps::hadoop::base':
    version                 => $version,
    primary_namenode        => $primary_namenode,
    secondary_namenode      => $secondary_namenode,
    datanodes               => $datanodes,
    primary_resourcemanager => $primary_resourcemanager,
    nodemanager_nodes       => $nodemanager_nodes,
  }
}

