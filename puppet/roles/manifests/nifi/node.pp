class roles::nifi::node {

  include ::profiles::utils::java
  include ::profiles::confs::nifi::node

  anchor { '::roles::nifi::node::start': } ->
  Class['::profiles::utils::java'] ->
  Class['::profiles::confs::nifi::node'] ->
  anchor { '::roles::nifi::node::end': }

}
