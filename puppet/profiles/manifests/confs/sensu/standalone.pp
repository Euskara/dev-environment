class profiles::confs::sensu::standalone {
  include ::profiles::apps::sensu::base
  include ::profiles::apps::sensu::plugins::sensu_plugins_disk_checks
  include ::profiles::apps::sensu::extensions::sensu_influxdb_extension
}
