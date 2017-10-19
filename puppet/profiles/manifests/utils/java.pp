class profiles::utils::java (

  $version,

) {

  java::oracle { 'jdk8' :
    ensure        => 'present',
    version       => $version,
    version_major => '8u131',
    version_minor => 'b11',
    java_se       => 'jdk',
    custom_url    => 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163',
  }

}
