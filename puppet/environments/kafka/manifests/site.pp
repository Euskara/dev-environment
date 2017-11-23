node /^standalone-kafka-(\d+).vagrant.local$/ {
  include ::roles::kafka::standalone
}
