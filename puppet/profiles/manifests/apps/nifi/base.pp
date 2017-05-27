class profiles::apps::nifi::base (

  $version,
  $custom_properties = {},
  $custom_state_management = {},

){

  class { '::nifi':
    version                  => $version,
    custom_properties        => $custom_properties,
    custom_state_management  => $custom_state_management,
  }

}

