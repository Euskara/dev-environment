class profiles::apps::hue::base (
  $custom_config = {
    'zookeeper' => {
      'clusters' => {
        'local' => {
          'host_ports' => 'localhost:2181',
          'rest_url'   => 'http://localhost:9998'
        }
      }
    }
  }


) {

  #class { '::hue':
  #  custom_config => $custom_config,
  #}
  #class { '::zookeeper_rest': }
  class { '::hadoop': }

}
