class profiles::confs::sensu::standalone {
  include ::profiles::apps::sensu::base
  include ::profiles::apps::sensu::plugins::sensu-plugins-disk-checks
}
