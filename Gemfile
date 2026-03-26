# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in faithteams-api.gemspec
gemspec

# Security floors for transitive dependencies not declared in the gemspec.
# These are not upper-bounded — bundle audit is the ongoing security check.
gem "rexml", ">= 3.4.2" # webmock → crack → rexml
gem "thor", ">= 1.4.0"  # guard-rspec → guard → thor
