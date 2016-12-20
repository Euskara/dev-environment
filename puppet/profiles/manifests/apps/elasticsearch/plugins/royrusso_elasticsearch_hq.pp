class profiles::apps::elasticsearch::plugins::royrusso_elasticsearch_hq (

  $ensure        = 'absent',
  $instance_name = 'base',

)
{

  ::elasticsearch::plugin { 'royrusso/elasticsearch-hq':
    ensure    => $ensure,
    instances => $instance_name,
  }

}
