class profiles::apps::logstash::base (

  $version,
  $filter_config = '{ filter { } }',

) {

  class { 'logstash':
    manage_repo   => true,
    repo_version  => '2.4',
    version       => $version,
  }
  logstash::configfile { 'logstash_filter':
    content => $filter_config,
  }
}
