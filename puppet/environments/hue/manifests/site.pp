node /^standalone-hue-(\d+).vagrant.local$/ {
  include ::profiles::apps::hue::base
}
