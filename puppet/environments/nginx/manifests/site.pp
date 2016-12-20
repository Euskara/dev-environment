node /^test-nginx-(\d+).vagrant.local$/ {
  include ::roles::nginx::test
}
