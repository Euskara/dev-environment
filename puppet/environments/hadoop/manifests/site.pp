node /^standalone-hadoop-(\d+).vagrant.local$/ {
  include ::roles::hadoop::standalone
}
node /^namenode-hadoop-(\d+).vagrant.local$/ {
  include ::roles::hadoop::namenode
}
node /^datanode-hadoop-(\d+).vagrant.local$/ {
  include ::roles::hadoop::datanode
}
node /^journalnode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::confs::hadoop::journalnode
}
