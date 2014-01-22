$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'
SimpleCov.start
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'
require 'omniauth-yammer'

RSpec.configure do |config|
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, type: :strategy
  
end
