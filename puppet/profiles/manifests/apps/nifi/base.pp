class profiles::apps::nifi::base (

  $version,

){

  class { '::nifi':
    version => $version,
  }

}

