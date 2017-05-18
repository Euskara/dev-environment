class profiles::confs::nifi::standalone (

  $version,

){

  class { '::profiles::apps::nifi::base':
    version => $version,
  }
}
