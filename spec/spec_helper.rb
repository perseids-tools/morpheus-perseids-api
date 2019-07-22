require 'rack/test'
require 'rspec'
require 'rspec/matchers'
require 'equivalent-xml'

ENV['RACK_ENV'] = 'test'

require_relative '../app.rb'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def fixture(name)
    File.open(File.join(__dir__, 'fixtures', name)).read
  end
end

RSpec.configure { |c| c.include RSpecMixin }
