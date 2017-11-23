class profiles::apps::grafana::base(
)
{
  class { 'grafana':
    cfg => {
      server => {
        http_port => 8080,
      }
    }
  }
}
