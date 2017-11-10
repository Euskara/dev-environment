node /^standalone(\d*)-kafka-(\d+).vagrant.local$/ {
  include ::roles::kafka::standalone
}
