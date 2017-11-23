class profiles::utils::erlang (

  $ensure = 'present',

){

  include ::epel

  package { 'erlang':
    ensure  => $ensure,
    require => Class[ 'epel' ],
  }

}
