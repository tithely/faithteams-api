# frozen_string_literal: true

require "bundler/setup"
require "pry"
require_relative "support/v2/stubs"
require "webmock/rspec"
require "byebug"
require "simplecov"

SimpleCov.command_name "RSpec"
SimpleCov.start do
  add_filter "spec/"
end

# This must be after the SimpleCov.start block
require "faithteams"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.order = :random

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
