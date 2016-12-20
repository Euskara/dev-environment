class profiles::apps::docker::base (

  $version,

)
{

  class { '::docker':
    version => $version,
  }

}
