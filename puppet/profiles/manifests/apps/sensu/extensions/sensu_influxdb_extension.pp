class profiles::apps::sensu::extensions::sensu_influxdb_extension
{
  sensu::plugin { 'sensu-extensions-influxdb':
    type         => 'package',
    pkg_version  => '2.1.0',
    pkg_provider => 'sensu_gem',
  }
  file { '/etc/sensu/extensions/influxdb.rb':
    ensure => link,
    target => '/opt/sensu/embedded/lib/ruby/gems/2.4.0/gems/sensu-extensions-influxdb-2.1.0/lib/sensu/extensions/influxdb.rb',
    owner  => 'sensu',
    group  => 'sensu',
  }
  sensu::write_json { '/etc/sensu/conf.d/influxdb-extension.json':
    content => {
      'influxdb-extension' => {
        'hostname' => $::ipaddress_enp0s8,
        'database' => 'sensu',
      },
    },
    notify  => [
      Service[ 'sensu-server' ],
      Service[ 'sensu-client' ],
    ]
  }
}
