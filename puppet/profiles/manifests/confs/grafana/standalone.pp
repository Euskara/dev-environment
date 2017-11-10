class profiles::confs::grafana::standalone {
  include ::profiles::apps::grafana::base
  grafana_datasource { 'influxdb':
    grafana_url      => "http://${::ipaddress_enp0s8}:3000",
    grafana_user     => 'admin',
    grafana_password => 'admin',
    type             => 'influxdb',
    url              => "http://${::ipaddress_enp0s8}:8086",
    database         => 'sensu',
    access_mode      => 'proxy',
    is_default       => true,
  }
}
