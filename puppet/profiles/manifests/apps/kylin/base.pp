class profiles::apps::kylin::base (
  $version,
){
  class { '::kylin':
    version => $version,
  }
}

