class profiles::utils::chocolatey::vs2015 ( )
{
  package { 'visualstudio2015community':
    ensure   => latest,
    provider => 'chocolatey',
  }
}
