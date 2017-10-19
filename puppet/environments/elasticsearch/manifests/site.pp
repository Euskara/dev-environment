node /^standalone-elasticsearch-(\d+).vagrant.local$/ {
  include ::roles::elasticsearch::standalone
}
