class profiles::utils::erlang {
  class { 'erlang':
    epel_enable => true
  }
}
