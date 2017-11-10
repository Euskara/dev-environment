class profiles::apps::sensu::plugins::sensu_plugins_disk_checks {
  sensu::plugin { 'sensu-plugins-disk-checks':
    type         => 'package',
    pkg_provider => 'sensu_gem',
  }
}
