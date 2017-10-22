class roles::kafka::kafka {
  class { 'zookeeper': }
  class { 'kafka': }
}
