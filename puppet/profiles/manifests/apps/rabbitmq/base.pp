class profiles::apps::rabbitmq::base (
)
{
  class { 'rabbitmq':
    repos_ensure          => true,
    service_manage        => true,
    port                  => 5672,
    management_ip_address => $::ipaddress_enp0s8,
    delete_guest_user     => true,
  }
}


