class profiles::utils::chocolatey::visualstudio::2015 ( )
{
  package { 'visualstudio2015community':
    enusre   => latest,
    provider => 'chocolatey',
  }
}
