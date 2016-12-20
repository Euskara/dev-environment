class profiles::confs::jenkins::bigtop {

  $java_version    = hiera('jenkins::java_version')
  $jenkins_version = hiera('jenkins::jenkins_version')
  $docker_version  = hiera('jenkins::docker_version')

  include ::profiles::utils::git
  class { '::profiles::apps::docker::base':
    version => $docker_version,
  }
  class { '::profiles::utils::java':
    version => $java_version,
  }

  class { '::profiles::apps::jenkins::base':
    version => $jenkins_version,
    require => Class[ '::profiles::utils::java' ],
  }
  include ::profiles::apps::jenkins::plugins::ec2
  include ::profiles::apps::jenkins::plugins::node_iterator_api
  include ::profiles::apps::jenkins::plugins::aws_java_sdk
  include ::profiles::apps::jenkins::plugins::aws_credentials
  include ::profiles::apps::jenkins::plugins::bouncycastle_api
  include ::profiles::apps::jenkins::plugins::jackson2_api
  include ::profiles::apps::jenkins::plugins::credentials_binding
  include ::profiles::apps::jenkins::plugins::workflow_step_api
  include ::profiles::apps::jenkins::plugins::plain_credentials
  include ::profiles::apps::jenkins::plugins::structs
  include ::profiles::apps::jenkins::plugins::metrics_diskusage
  include ::profiles::apps::jenkins::plugins::dynamic_axis
  include ::profiles::apps::jenkins::plugins::metrics
  include ::profiles::apps::jenkins::plugins::disk_usage
  include ::profiles::apps::jenkins::plugins::mailer
  include ::profiles::apps::jenkins::plugins::display_url_api
  include ::profiles::apps::jenkins::plugins::git
  include ::profiles::apps::jenkins::plugins::gradle
  include ::profiles::apps::jenkins::plugins::junit
  include ::profiles::apps::jenkins::plugins::extended_read_permission
  include ::profiles::apps::jenkins::plugins::job_dsl
  include ::profiles::apps::jenkins::plugins::matrix_auth
  include ::profiles::apps::jenkins::plugins::matrix_project
  include ::profiles::apps::jenkins::plugins::ssh_credentials
  include ::profiles::apps::jenkins::plugins::git_client
  include ::profiles::apps::jenkins::plugins::workflow_scm_step
  include ::profiles::apps::jenkins::plugins::icon_shim
  include ::profiles::apps::jenkins::plugins::script_security
  include ::profiles::apps::jenkins::plugins::matrix_reloaded
  include ::profiles::apps::jenkins::plugins::parameterized_trigger
  include ::profiles::apps::jenkins::plugins::ssh_agent
  include ::profiles::apps::jenkins::plugins::scm_api
  include ::profiles::apps::jenkins::plugins::conditional_buildstep
  include ::profiles::apps::jenkins::plugins::maven_plugin
  include ::profiles::apps::jenkins::plugins::token_macro
  include ::profiles::apps::jenkins::plugins::run_condition
  include ::profiles::apps::jenkins::plugins::javadoc
  include ::profiles::apps::jenkins::plugins::ssh_slaves
  include ::profiles::apps::jenkins::plugins::timestamper
  include ::profiles::apps::jenkins::plugins::nexus_artifact_uploader

  ::jenkins::job { 'bigtop_build':
    config => template("static_files/jenkins/bigtop_build.xml.erb"),
  }
  group { 'docker':
    ensure  => present,
  }
  User <| title == 'jenkins' |> {
    groups  +> 'docker',
    require => Group[ 'docker' ],
    notify  => Service[ 'jenkins' ],
  }

}