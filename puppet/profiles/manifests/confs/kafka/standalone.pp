class profiles::confs::kafka::standalone(

  $java_version  = '8',
  $kafka_version = '0.11.0.1',
  $scala_version = '2.12',

){

  class { 'profiles::utils::java':
    version => $java_version,
  }
  -> class { 'profiles::apps::zookeeper::base': }
  -> class { 'profiles::apps::kafka::base':
    version       => $kafka_version,
    scala_version => $scala_version,
  }

}
