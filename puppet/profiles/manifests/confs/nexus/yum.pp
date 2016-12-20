class profiles::confs::nexus::yum {

  $java_version       = hiera('nexus::java_version')
  $nexus_version      = hiera('yum::nexus_version')
  $nexus_revision     = hiera('yum::nexus_revision')
  $createrepo_version = hiera('yum::createrepo_version')


  class { '::profiles::utils::java':
    version => $java_version,
  }

  package { 'createrepo':
    ensure => $createrepo_version,
  }

  class { '::profiles::apps::nexus::base':
    version  => $nexus_version,
    revision => $nexus_revision,
    require  => [ Class[ '::profiles::utils::java' ], Package[ 'createrepo' ] ],
  }

}