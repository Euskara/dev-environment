class profiles::confs::hadoop::namenode {
  $primary_namenode   = hiera('hadoop::primary_namenode')
  $secondary_namenode = hiera('hadoop::secondary_namenode')
  $datanodes          = hiera('hadoop::datanodes')
  $journal_nodes      = hiera('hadoop::journalnodes')
  $zookeeper_nodes    = hiera('hadoop::zookeeper_servers')

  class { '::profiles::apps::hadoop::base':
    primary_namenode   => $primary_namenode,
    secondary_namenode => $secondary_namenode,
    datanodes          => $datanodes,
    zookeeper_nodes    => $zookeeper_nodes,
    journal_nodes      => $journal_nodes,
  }
}