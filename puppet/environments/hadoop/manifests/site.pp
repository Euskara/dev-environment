node /^master-hadoop-(\d+).vagrant.local$/ {
  include ::profiles::apps::hadoop::base
}