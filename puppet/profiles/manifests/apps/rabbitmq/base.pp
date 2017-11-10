class profiles::apps::rabbitmq::base (
  $ensure = 'present',
)
{
  class { 'rabbitmq':
    package_ensure        => $ensure,
    repos_ensure          => true,
    service_manage        => true,
    port                  => 5672,
    management_ip_address => $::ipaddress_enp0s8,
    delete_guest_user     => true,
  }
}


