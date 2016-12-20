class profiles::apps::hadoop::base (

  $java_version    = hiera('hadoop::java_version'),
  $master_hostname = hiera('hadoop::master_hostname'),

)
{
  include ::profiles::utils::bigtop_repo
  class { '::profiles::utils::java':
    version => $java_version,
  }

  class{ '::hadoop':
    hdfs_hostname => $::fqdn,
    yarn_hostname => $::fqdn,
    hue_hostnames => [ $master_hostname ],
    slaves => [ $::fqdn ],
    frontends => [ $::fqdn ],
    properties => {
      'dfs.replication' => 1,
    }
  }

  include hadoop::namenode
  include hadoop::resourcemanager
  include hadoop::historyserver
  include hadoop::datanode
  include hadoop::nodemanager
  include hadoop::frontend

  class { '::hue':
    hdfs_hostname => $master_hostname,
    secret        => 'password',
  }
  include ::hue::hdfs

}