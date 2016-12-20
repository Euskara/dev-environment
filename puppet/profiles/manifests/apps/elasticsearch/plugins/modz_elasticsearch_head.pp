class profiles::apps::elasticsearch::plugins::modz_elasticsearch_head (

  $ensure        = 'absent',
  $instance_name = 'base',

)
{

  ::elasticsearch::plugin { 'mobz/elasticsearch-head':
    ensure    => $ensure,
    instances => $instance_name,
  }

}
