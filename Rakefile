require 'puppetlabs_spec_helper/rake_tasks'

exclude_paths = %w(
  puppet/.librarian/**/*
  puppet/.tmp/**/*
  puppet/modules/**/*
  spec/**/*
)

PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths
