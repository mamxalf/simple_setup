# frozen_string_literal: true

require_relative 'lib/simple_setup/version'

Gem::Specification.new do |spec|
  spec.name = 'simple_setup'
  spec.version = SimpleSetup::VERSION
  spec.authors = ['Hammam Firdaus']
  spec.email = ['hammamxalf@gmail.com']

  spec.summary = 'Simple Setup for Init new Project'
  spec.description = 'Simple Setup for Init new Project and Include many Template for Reduce Time :)))'
  spec.homepage = 'https://github.com/mamxalf'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.5'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  #
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  # dependency
  # for authentication
  spec.add_dependency 'devise', '~> 4.9', '>= 4.9.2'
  # pagy for pagination
  spec.add_dependency 'pagy', '~> 6.0' # omit patch digit
  # hashie
  spec.add_dependency 'hashie', '~> 5.0'
  # dry-rb group
  spec.add_dependency 'dry-matcher', '~> 1.0'
  spec.add_dependency 'dry-monads', '~> 1.6'
  spec.add_dependency 'dry-struct', '~> 1.6'
  spec.add_dependency 'dry-validation', '~> 1.10'
  # grape
  spec.add_dependency 'grape', '~> 1.7'
  # swagger for grape
  spec.add_dependency 'grape-swagger', '~> 1.5'
  spec.add_dependency 'grape-swagger-rails', '~> 0.3.1'
  # rubocop for linter
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-performance', '~> 1.17', '>= 1.17.1'
  spec.add_dependency 'rubocop-rails', '~> 2.18'
  # faker factory
  spec.add_dependency 'factory_bot', '~> 6.2', '>= 6.2.1'
  spec.add_dependency 'factory_bot_rails', '~> 6.2'
  spec.add_dependency 'faker', '~> 3.1', '>= 3.1.1'
  # help to kill N+1 queries and unused eager loading.
  spec.add_dependency 'bullet', '~> 7.0', '>= 7.0.7'
  # rspec for unit test
  spec.add_dependency 'rspec', '~> 3.12'
  spec.add_dependency 'rspec-rails', '~> 6.0', '>= 6.0.1'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
