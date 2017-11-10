class roles::grafana::standalone {
  include ::profiles::confs::influxdb::standalone
  include ::profiles::confs::grafana::standalone
}

