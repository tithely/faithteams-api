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
  # Allowlisted, not denylisted: only what the gem needs at runtime plus a
  # few standard root docs. A denylist has to be remembered and updated
  # every time a new dev-tooling directory shows up in the repo - that's
  # how thunder-tests/ (and its live test-tenant credential) ended up
  # shipping in the published gem unnoticed.
  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").select do |f|
      f.match(%r{^(lib|exe)/}) || %w[README.md LICENSE CHANGELOG.md faithteams-api.gemspec].include?(f)
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 7.2"
  spec.add_dependency "http", "~> 5.1"

  spec.add_development_dependency "byebug", "~> 11.1"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.73"
  spec.add_development_dependency "rubocop-performance", "~> 1.24"
  spec.add_development_dependency "rubocop-rake", "~> 0.7"
  spec.add_development_dependency "rubocop-rspec", "~> 3.5"
  spec.add_development_dependency "webmock", "~> 3.18"
  spec.add_development_dependency "yard", "~> 0.9"
end
