class profiles::apps::uchiwa::base (
)
{
  class { 'uchiwa':
    host => $::ipaddress_enp0s8,
  }
}
