class roles::sensu::standalone {
  include ::profiles::confs::rabbitmq::standalone
  include ::profiles::confs::redis::standalone
  include ::profiles::confs::sensu::standalone
  include ::profiles::confs::uchiwa::standalone
  include ::profiles::confs::influxdb::standalone
  include ::profiles::confs::grafana::standalone
}
