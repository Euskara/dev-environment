class profiles::confs::sensu::standalone {
  include ::profiles::apps::sensu::base
  include ::profiles::apps::sensu::extensions::sensu_influxdb_extension
  include ::profiles::apps::sensu::handlers::influxdb
  include ::profiles::apps::sensu::plugins::sensu_plugins_disk_checks
  include ::profiles::apps::sensu::metrics::disk_capacity
}
