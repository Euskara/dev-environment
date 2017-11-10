class profiles::apps::influxdb::base (
)
{
  class { 'influxdb::server':
    meta_bind_address      => "${::ipaddress_enp0s8}:8088",
    meta_http_bind_address => "${::ipaddress_enp0s8}:8091",
    http_bind_address      => "${::ipaddress_enp0s8}:8086",
  }
}
