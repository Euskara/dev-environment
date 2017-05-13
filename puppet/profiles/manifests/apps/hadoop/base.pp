class profiles::apps::hadoop::base (
  $version,
  $primary_namenode,
  $secondary_namenode = undef,
  $datanodes,
  $journal_nodes = undef,
  $primary_resourcemanager,
  $nodemanager_nodes,
  $historyserver,
  $timelineserver,
  $zookeeper_nodes = undef,
)
{
  class { '::hadoop':
    version                  => $version,
    primary_namenode         => $primary_namenode,
    secondary_namenode       => $secondary_namenode,
    datanodes                => $datanodes,
    journal_nodes            => $journal_nodes,
    primary_resourcemanager  => $primary_resourcemanager,
    nodemanager_nodes        => $nodemanager_nodes,
    historyserver            => $historyserver,
    timelineserver           => $timelineserver,
    zookeeper_nodes          => $zookeeper_nodes,
    overwrite_hdfs_site_conf => {
      'dfs.namenode.rpc-bind-host'     => '0.0.0.0',
      'dfs.namenode.http-bind-host'    => '0.0.0.0',
    },
    overwrite_yarn_site_conf => {
      'yarn.resourcemanager.bind-host' => '0.0.0.0',
    }
  }

}
