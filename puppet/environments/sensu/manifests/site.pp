node /^standalone-sensu-(\d+).vagrant.local$/ {
  include ::roles::sensu::standalone
}
