class roles::nifi::master {
  include ::profiles::utils::java
  include ::profiles::confs::zookeeper::standalone
  include ::profiles::confs::nifi::node

  anchor { '::roles::nifi::master::start': } ->
  Class['::profiles::utils::java'] ->
  Class['::profiles::confs::zookeeper::standalone'] -> 
  Class['::profiles::confs::nifi::node'] ->
  anchor { '::roles::nifi::master::end': }
}
