class roles::grafana::grafana {
  class { 'influxdb::server':
    meta_bind_address      =>  "${::fqdn}:8088",
    meta_http_bind_address =>  "${::fqdn}:8091",
    http_bind_address      =>  "${::fqdn}:8086",
  }
  class { 'grafana': }
}

