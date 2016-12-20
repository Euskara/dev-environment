class profiles::apps::elasticsearch::plugins::lmenezes_elasticsearch_kopf (

  $ensure        = 'absent',
  $instance_name = 'base',

){

  ::elasticsearch::plugin { 'lmenezes/elasticsearch-kopf':
    ensure    => $ensure,
    instances => $instance_name,
  }

}
