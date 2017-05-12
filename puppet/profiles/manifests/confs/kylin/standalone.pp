class profiles::confs::kylin::standalone (
  $version,
){
  class { '::profiles::apps::kylin::base':
    version => $version,
  }
}
