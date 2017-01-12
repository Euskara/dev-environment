class profiles::confs::hadoop::journalnode {
  $primary_namenode   = hiera('hadoop::primary_namenode')
  $secondary_namenode = hiera('hadoop::secondary_namenode')
  $datanodes          = hiera('hadoop::datanodes')
  $journal_nodes      = hiera('hadoop::journalnodes')
  $zookeeper_id       = hiera('zookeeper::zookeeper_id')
  $zookeeper_nodes    = hiera('hadoop::zookeeper_servers')

  class { '::profiles::apps::zookeeper::base':
    id      => $zookeeper_id,
    servers => $zookeeper_nodes,
  }

  class { '::profiles::apps::hadoop::base':
    primary_namenode   => $primary_namenode,
    secondary_namenode => $secondary_namenode,
    datanodes          => $datanodes,
    journal_nodes      => $journal_nodes,
  }
}
