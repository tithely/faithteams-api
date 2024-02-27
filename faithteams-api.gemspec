# frozen_string_literal: true

require_relative "lib/faithteams/version"

Gem::Specification.new do |spec|
  spec.name          = "faithteams-api"
  spec.version       = FaithTeams::VERSION
  spec.authors       = ["Tithe.ly Integrations"]
  spec.email         = ["integrations@tithe.ly"]

  spec.summary       = "A Faithteams API client gem."
  spec.description   = "Provides methods and utilities for interacting with the faithteams API."
  spec.homepage      = "https://github.com/tithely/faithteams-api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/tithely"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tithely/faithteams-api"
  spec.metadata["changelog_uri"] = "https://github.com/tithely/faithteams-api/blob/master/doc/CHANGELOG.md"
  spec.metadata["github_repo"] = "https://github.com/tithely/faithteams-api"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 6.1.7"
  spec.add_dependency "http", "~> 5.1"

  spec.add_development_dependency "byebug", "~> 11.1"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.42"
  spec.add_development_dependency "rubocop-performance", "~> 1.17"
  spec.add_development_dependency "rubocop-rake", "~> 0.6"
  spec.add_development_dependency "rubocop-rspec", "~> 1.42"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "yard", "~> 0.9"
end
