class profiles::apps::logstash::plugins::logstash_input_azureeventhub (

  $ensure,
  $key,
  $username,
  $namespace,
  $eventhub,
  $partitions,
  $consumer_group = '$default',

){

  ::logstash::plugin { 'logstash-input-azureeventhub':
    ensure => $ensure,
  }
  if ensure == 'present' {
    ::logstash::configfile { 'logstash_input_azureeventhub_config':
      content => "
input { 
  azureeventhub { 
   key => \"${key}\"
   username => \"${username}\"
   namespace => \"${namespace}\"
   eventhub => \"${eventhub}\"
   partitions => ${partitions}
   consumer_group => \"${consumer_group}\"
  }
}",
    }
  }

}
