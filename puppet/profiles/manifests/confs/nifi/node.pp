class profiles::confs::nifi::node (
  $version,
  $custom_properties,
  $custom_state_management,
)
{
  $default_properties = {
    'nifi.cluster.is.node'            => true,
    'nifi.cluster.node.address'       => $::ipaddress_enp0s8,
    'nifi.cluster.node.protocol.port' => 9999,
    'nifi.web.http.host'              => $::ipaddress_enp0s8,
  }
  $properties = deep_merge($default_properties, $custom_properties)

  class { 'profiles::apps::nifi::base':
    version                 => $version,
    custom_properties       => $properties,
    custom_state_management => $custom_state_management,
  }
}
