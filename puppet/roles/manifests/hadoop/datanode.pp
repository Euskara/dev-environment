class roles::hadoop::datanode {
  include ::profiles::utils::java
  include ::profiles::confs::hadoop::datanode
}

