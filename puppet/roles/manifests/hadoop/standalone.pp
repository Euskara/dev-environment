class roles::hadoop::standalone {
  include ::profiles::utils::java
  include ::profiles::confs::hadoop::standalone
}
