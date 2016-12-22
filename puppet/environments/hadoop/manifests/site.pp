node /^namenode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::apps::hadoop::base
}
node /^datanode-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::apps::hadoop::base
}