class profiles::apps::logstash::plugins::logstash_output_elasticsearch (

  $hosts,

){

  ::logstash::plugin { 'logstash-output-elasticsearch':
    ensure => present,
  }
  ::logstash::configfile { 'logstash_output_elasticsearch_config':
    content => "{ output { elasticsearch { hosts => ${hosts} } } }",
    order   => 30,
  }

}
