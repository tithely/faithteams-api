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
  spec.required_ruby_version = Gem::Requirement.new(">= 3.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tithely/faithteams-api"
  spec.metadata["github_repo"] = "https://github.com/tithely/faithteams-api"
  spec.metadata["changelog_uri"] = "https://github.com/tithely/faithteams-api/blob/master/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/tithely/faithteams-api/issues"
  spec.metadata["documentation_uri"] = "https://github.com/tithely/faithteams-api/blob/master/README.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 7.2.2"
  spec.add_dependency "http", "~> 5.1"
  spec.add_dependency "logger", "~> 1.6.1"
  spec.add_dependency "ostruct", "~> 0.6.0"
  spec.add_dependency "rexml", "~> 3.3.9" # only needs to be specified to address security warning
  spec.add_dependency "thor", "~> 1.4.0"

  spec.add_development_dependency "byebug", "~> 11.1"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.73.2"
  spec.add_development_dependency "rubocop-performance", "~> 1.24.0"
  spec.add_development_dependency "rubocop-rake", "~> 0.7.1"
  spec.add_development_dependency "rubocop-rspec", "~> 3.5.0"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "yard", "~> 0.9.36"
end
