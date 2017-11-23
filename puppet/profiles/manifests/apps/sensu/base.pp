class profiles::apps::sensu::base (
)
{
  class { 'sensu':
    server            => true,
    api               => true,
    rabbitmq_host     => $::ipaddress_enp0s8,
    rabbitmq_user     => 'sensu',
    rabbitmq_password => 'sensu',
    rabbitmq_vhost    => 'sensu',
    redis_host        => $::ipaddress_enp0s8,
  }

}
