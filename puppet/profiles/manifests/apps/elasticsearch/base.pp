class profiles::apps::elasticsearch::base (
  $version,
  $instance_name = 'base',

) {

  class { 'elasticsearch':
    manage_repo       => true,
    repo_version      => '2.x',
    version           => $version,
    restart_on_change => true,
    config => {
      'network' => {
        'host' => '0.0.0.0',
      },
    },
  }

  ::elasticsearch::instance { $instance_name: }

}
