class profiles::confs::elasticsearch::standalone (
  $version,
  $instance_name,
)
{
  class { '::profiles::utils::java': }
  -> class { '::profiles::apps::elasticsearch::base':
    version       => $version,
    instance_name => $instance_name,
  }
}
