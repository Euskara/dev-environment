class profiles::confs::elk::standalone {

  $java_version                                     = hiera('elk::java_version')

  $elasticsearch_version                            = hiera('elk::elasticsearch::version')
  $elasticsearch_instance_name                      = hiera('elk::elasticsearch::instance_name')
  $elasticsearch_modz_elasticsearch_head_ensure     = hiera('elk::elasticsearch::modz_elasticsearch_head::ensure')
  $elasticsearch_royrusso_elasticsearch_hq_ensure   = hiera('elk::elasticsearch::royrusso_elasticsearch_hq::ensure')
  $elasticsearch_lmenezes_elasticsearch_kopf_ensure = hiera('elk::elasticsearch::lmenezes_elasticsearch_kopf::ensure')


  $logstash_version                                 = hiera('elk::logstash::version')

  $logstash_azureeventhub_ensure                    = hiera('elk::logstash::azureeventhub::ensure')
  $logstash_azureeventhub_key                       = hiera('elk::logstash::azureeventhub::key')
  $logstash_azureeventhub_username                  = hiera('elk::logstash::azureeventhub::username')
  $logstash_azureeventhub_namespace                 = hiera('elk::logstash::azureeventhub::namespace')
  $logstash_azureeventhub_evenhub                   = hiera('elk::logstash::azureeventhub::evenhub')
  $logstash_azureeventhub_partitions                = hiera('elk::logstash::azureeventhub::partitions')
  $logstash_azureeventhub_consumer_group            = hiera('elk::logstash::azureeventhub::consumer_group')

  $kibana_version                                   = hiera('elk::kibana::version')

  class { '::profiles::utils::java':
    version => $java_version,
  } ->
  class { '::profiles::apps::elasticsearch::base':
    version       => $elasticsearch_version,
    instance_name => $elasticsearch_instance_name,
  } ->
  class { '::profiles::apps::kibana::base':
    version => $kibana_version,
  } ->
  class { '::profiles::apps::logstash::base':
    version => $logstash_version,
  }
  class { '::profiles::apps::elasticsearch::plugins::modz_elasticsearch_head':
    ensure        => $elasticsearch_modz_elasticsearch_head_ensure,
    instance_name => $elasticsearch_instance_name,
  }
  class { '::profiles::apps::elasticsearch::plugins::royrusso_elasticsearch_hq':
    ensure        => $elasticsearch_royrusso_elasticsearch_hq_ensure,
    instance_name => $elasticsearch_instance_name,
  }
  class { '::profiles::apps::elasticsearch::plugins::lmenezes_elasticsearch_kopf':
    ensure        => $elasticsearch_lmenezes_elasticsearch_kopf_ensure,
    instance_name => $elasticsearch_instance_name,
  }
  class { '::profiles::apps::logstash::plugins::logstash_input_azureeventhub':
    ensure         => $logstash_azureeventhub_ensure,
    key            => $logstash_azureeventhub_key,
    username       => $logstash_azureeventhub_username,
    namespace      => $logstash_azureeventhub_namespace,
    eventhub       => $logstash_azureeventhub_evenhub,
    partitions     => $logstash_azureeventhub_partitions,
    consumer_group => $logstash_azureeventhub_consumer_group,
    require        => Class[ '::profiles::apps::logstash::base' ],
  }
  class { '::profiles::apps::logstash::plugins::logstash_output_elasticsearch':
    hosts   => '["localhost:9200"]',
    require => Class[ '::profiles::apps::logstash::base' ],
  }
}
