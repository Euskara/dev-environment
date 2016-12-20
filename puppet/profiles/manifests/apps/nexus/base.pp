class profiles::apps::nexus::base (

  $version,
  $revision,

) {

  class{ '::nexus':
    version    => $version,
    revision   => $revision,
    nexus_port => '8081',
    nexus_host => $::ipaddress_enp0s8,
  }
}