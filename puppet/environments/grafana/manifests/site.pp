node /^standalone(\d*)-grafana-(\d+).vagrant.local$/ {
  include ::roles::grafana::standalone
}
