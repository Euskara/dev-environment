class profiles::utils::java (

  $version,

) {

  java::oracle { 'jdk8' :
    ensure  => 'present',
    version => $version,
    java_se => 'jdk',
  }

}
