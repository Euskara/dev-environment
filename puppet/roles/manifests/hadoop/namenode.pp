class roles::hadoop::namenode {
  include ::profiles::utils::java
  include ::profiles::confs::hadoop::namenode
}

