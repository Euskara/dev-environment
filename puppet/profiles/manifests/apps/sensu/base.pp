class profiles::apps::sensu::base (
)
{
  class { 'sensu':
    server            => true,
    api               => true,
    rabbitmq_host     => $::ipaddress_enp0s8,
    rabbitmq_user     => 'sensu',
    rabbitmq_password => 'sensu',
    rabbitmq_vhost    => '/sensu',
    redis_host        => $::ipaddress_enp0s8,
  }
  sensu::write_json { '/etc/sensu/conf.d/influxdb-extension.json':
    content => {
      'influxdb-extension' => {
        'hostname' => '172.16.0.12',
        'database' => 'sensu',
      },
    }
  }
  sensu::handler { 'metrics':
    type     => 'set',
    handlers => [ 'influxdb-extension' ],
  }
  sensu::check { 'metrics_disk_capacity':
    type     => 'metric',
    command  => '/opt/sensu/embedded/bin/ruby /opt/sensu/embedded/bin/metrics-disk-capacity.rb',
    handlers => [ 'metrics' ],

  }
}
