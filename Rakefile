require 'puppetlabs_spec_helper/rake_tasks'

exclude_paths = [
  "puppet/.librarian/**/*",
  "puppet/.tmp/**/*",
  "puppet/modules/**/*",
  "spec/**/*"
]

PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = exclude_paths
  config.log_format = '%{path}:%{line}:%{column} - %{check} - %{KIND}:%{message}'
  config.disable_checks = [
    'documentation',
    '140chars',
  ]
end

PuppetSyntax.exclude_paths = exclude_paths

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
  :spec,
]

desc 'Run acceptance tests'
RSpec::Core::RakeTask.new(:acceptance) do |t|
  t.pattern = 'spec/acceptance'
end
