class profiles::utils::gradle (
  $version = '3.2.1'
)
{
  class { '::gradle':
    version => $version,
  }
}  