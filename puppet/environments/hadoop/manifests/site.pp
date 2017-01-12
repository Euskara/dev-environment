node /^namenode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::confs::hadoop::namenode
}
node /^datanode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::confs::hadoop::datanode
}
node /^journalnode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::confs::hadoop::journalnode
}