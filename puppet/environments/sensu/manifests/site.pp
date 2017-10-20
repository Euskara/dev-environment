node /^standalone(\d*)-sensu-(\d+).vagrant.local$/ {
  include ::roles::sensu::standalone
}
