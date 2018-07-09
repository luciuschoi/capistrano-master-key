# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/master_key/version'

Gem::Specification.new do |gem|
  gem.name          = 'capistrano-master-key'
  gem.version       = Capistrano::MasterKey::VERSION
  gem.authors       = ['Bruno Sutic, Virgoproz']
  gem.email         = ['bruno.sutic@gmail.com']
  gem.description   = <<-EOF.gsub(/^\s+/, '')
    Capistrano tasks for automating `master.key` file handling for Rails 5.2+ apps.

    This plugins syncs contents of your local master key and copies that to
    the remote server.
  EOF
  gem.summary       = 'Capistrano tasks for automating `master.key` file handling for Rails 5.2+ apps.'
  gem.homepage      = 'https://github.com/virgoproz/capistrano-master-key'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.license       = 'MIT'

  gem.add_dependency 'capistrano', '~> 3.11'
  gem.add_dependency 'sshkit', '~> 1.17'

  gem.add_development_dependency 'rake', '~> 12.3'
end
