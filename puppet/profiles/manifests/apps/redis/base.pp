class profiles::apps::redis::base (
)
{
  class { 'redis':
    bind => $::ipaddress_enp0s8
  }
}
