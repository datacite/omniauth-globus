# frozen_string_literal: true

require "bundler/setup"
Bundler.setup

require "simplecov"
SimpleCov.start

require "rspec"
require "rack/test"
require "webmock/rspec"
require "omniauth-globus"

def fixture_path
  File.expand_path("fixtures", __dir__) + "/"
end

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, type: :strategy
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
