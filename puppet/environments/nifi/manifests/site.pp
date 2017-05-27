node /^standalone-nifi-(\d+).vagrant.local$/ {
  include ::roles::nifi::standalone
}

node /^node-nifi-(\d+).vagrant.local$/ {
  include ::roles::nifi::node
}

node /^master-nifi-(\d+).vagrant.local$/ {
  include ::roles::nifi::master
}

