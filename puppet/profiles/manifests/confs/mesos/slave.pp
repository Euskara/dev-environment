class profiles::confs::mesos::slave (

  $mesos_version   = hiera('mesos_slave::mesos_version'),
  $mesos_zookeeper = hiera('mesos_master::zookeeper_servers'),
  $docker_version  = hiera('mesos_slave::docker_version'),

)
{

  class { '::profiles::apps::docker::base':
    version => $docker_version,
  }

  class { '::profiles::apps::mesos::base':
    version   => $mesos_version,
    zookeeper => $mesos_zookeeper,
  }

  $log_dir = '/var/log/mesos'
  file { $log_dir:
    ensure => directory,
  }

  class{ '::mesos::slave':
    work_dir => '/var/lib/mesos',
    attributes => {
      'env' => 'mesos',
    },
    resources  => {
      'ports' => '[10000-65535]'
    },
    options    => {
      'isolation'                     => 'cgroups/cpu,cgroups/mem',
      'containerizers'                => 'docker,mesos',
      'hostname'                      => $::fqdn,
      'log_dir'                       => $log_dir,
      'logging_level'                 => 'WARNING',
      'executor_registration_timeout' => '10mins',
      'modules'                       => '{"libraries":[{"file":"/usr/lib/mesos/modules/liblogrotate_container_logger.so", "modules":[{"name":"org_apache_mesos_LogrotateContainerLogger"}]}]}',
      'container_logger'              => 'org_apache_mesos_LogrotateContainerLogger',
    },
    require  => File[ $log_dir ],
  }

}
