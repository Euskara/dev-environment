class profiles::apps::hadoop::base (
  $primary_namenode,
  $secondary_namenode,
  $datanodes,
  $journal_nodes,
  $zookeeper_nodes = undef,
)
{
  class { '::hadoop':
    primary_namenode         => $primary_namenode,
    secondary_namenode       => $secondary_namenode,
    datanodes                => $datanodes,
    journal_nodes            => $journal_nodes,
    zookeeper_nodes          => $zookeeper_nodes,
    overwrite_hdfs_site_conf => {
      'dfs.namenode.rpc-bind-host'  => '0.0.0.0',
      'dfs.namenode.http-bind-host' => '0.0.0.0',
    }
  }

}