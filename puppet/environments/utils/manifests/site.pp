node /^gradle-utils-(\d+).vagrant.local$/ {
  class { '::profiles::utils::gradle': }
}
