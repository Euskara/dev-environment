class profiles::apps::jenkins::base (

  $version,

) {

  class { '::jenkins':
    version      => $version,
    install_java => false,

  }
}
