class profiles::apps::hadoop::base (

  $java_version    = hiera('hadoop::java_version'),
  $master_hostname = hiera('hadoop::master_hostname'),

)
{
  include ::hadoop

}