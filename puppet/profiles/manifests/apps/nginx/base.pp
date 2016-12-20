class profiles::apps::nginx::base (

){

class { 'nginx':
  vhost_purge => true,
}
file { "/opt/${::fqdn}.crt":
  ensure => present,
  source => 'puppet:///modules/static_files/ssl_certificates/wildcard.crt',
}
file { "/opt/${::fqdn}.key":
  ensure => present,
  source => 'puppet:///modules/static_files/ssl_certificates/wildcard.key',
}
nginx::resource::vhost{ $::fqdn:
    www_root => '/opt/html/',
    ssl      => true,
    ssl_cert => "/opt/${::fqdn}.crt",
    ssl_key  => "/opt/${::fqdn}.key",
  }

}
