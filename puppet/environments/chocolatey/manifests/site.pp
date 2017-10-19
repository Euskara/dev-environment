node /^windows10-chocolatey-(\d+).vagrant.local$/ {

  include ::profiles::utils::chocolatey
  include ::profiles::utils::chocolatey::vs2015

}

