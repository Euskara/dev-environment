class profiles::confs::mesos::master (

  $java_version     = hiera('mesos::java_version'),
  $zookeeper_id     = hiera('zookeeper::zookeeper_id'),
  $mesos_version    = hiera('mesos_master::mesos_version'),
  $mesos_zookeeper  = hiera('mesos_master::zookeeper_servers'),
  $cluster_name     = hiera('mesos_master::cluster_name'),
  $marathon_version = hiera('marathon::marathon_version'),

)
{

  class { '::profiles::utils::java':
    version => $java_version,
  }

  class { '::profiles::apps::zookeeper::base':
    id      => $zookeeper_id,
    servers => $mesos_zookeeper,
    require => Class[ '::profiles::utils::java' ],
  }

  class { '::profiles::apps::mesos::base':
    version   => $mesos_version,
    zookeeper => $mesos_zookeeper,
    require   => Class[ '::profiles::apps::zookeeper::base' ],
  }

  $log_dir = '/var/log/mesos'
  file { $log_dir:
    ensure => directory,
  }

  class{ '::mesos::master':
    cluster  => $cluster_name,
    work_dir => '/var/lib/mesos',
    options  => {
      quorum => 2,
      log_dir => $log_dir,
      logging_level => 'WARNING',
    },
    require  => File[ $log_dir ],
  }

  class { '::profiles::apps::marathon::base':
    version   => $marathon_version,
    zookeeper => $mesos_zookeeper,
    require   => Class[ '::mesos::master', '::profiles::utils::java' ],
  }

}
