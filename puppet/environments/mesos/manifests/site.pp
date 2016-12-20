node /^master-mesos-(\d+).vagrant.local$/ {
  include ::roles::mesos::master
}

node /^slave-mesos-(\d+).vagrant.local$/ {
  include ::roles::mesos::slave
}
