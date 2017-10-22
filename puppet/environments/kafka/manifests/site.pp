node /^kafka-kafka-(\d+).vagrant.local$/ {
  include ::roles::kafka::kafka
}
