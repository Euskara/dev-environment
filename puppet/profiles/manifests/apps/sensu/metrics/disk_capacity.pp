class profiles::apps::sensu::metrics::disk_capacity {

  sensu::check { 'metrics_disk_capacity':
    type     => 'metric',
    command  => '/opt/sensu/embedded/bin/ruby /opt/sensu/embedded/bin/metrics-disk-capacity.rb',
    handlers => [ 'metrics' ],
  }

}
