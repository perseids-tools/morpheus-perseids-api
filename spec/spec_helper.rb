require 'rack/test'
require 'rspec'
require 'rspec/matchers'
require 'json'
require 'erb'
require 'equivalent-xml'

require_relative '../lib/config'

ENV['RACK_ENV'] = 'test'

require_relative '../app'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def fixture(name)
    JSON.parse(File.read(File.join(__dir__, 'fixtures', name)))
  end
end

RSpec.configure do |config|
  config.include RSpecMixin

  if Config::REDIS_ENABLED == 'true'
    config.before(:all) { Redis.new.flushall }
    config.after { Redis.new.flushall }
  end
end
