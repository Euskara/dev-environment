class profiles::apps::kibana::base (

  $version

){

  class { 'kibana4':
    manage_repo          => true,
    package_repo_version => '4.6',
    version              => $version,
  }

}
