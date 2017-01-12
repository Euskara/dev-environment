class profiles::confs::hadoop::datanode {
  $primary_namenode   = hiera('hadoop::primary_namenode')
  $secondary_namenode = hiera('hadoop::secondary_namenode')
  $datanodes          = hiera('hadoop::datanodes')
  $journal_nodes      = hiera('hadoop::journalnodes')

  class { '::profiles::apps::hadoop::base':
    primary_namenode   => $primary_namenode,
    secondary_namenode => $secondary_namenode,
    datanodes          => $datanodes,
    journal_nodes      => $journal_nodes,
  }
}