node /^yum-nexus-(\d+).vagrant.local$/ {
  include ::roles::nexus::yum
}
