require 'sinatra'
require 'redis'
require 'json'
require 'beta_code'
require './lib/config'
require './lib/morpheus'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new(Config::MORPHLIB, Config::EXECUTABLE)
set :port, Config::PORT

redis = Redis.new

get '/greek/:word' do
  content_type :xml
  key = params.to_json
  cached = redis.get(key)
  return cached if cached

  word = BetaCode.greek_to_beta_code(params[:word])
  settings.morpheus.response(word, params[:opts], :Greek).tap do |content|
    redis.set(key, content)
    redis.expire(key, Config::EXPIRY)
  end
end

get '/latin/:word' do
  content_type :xml
  key = params.to_json
  cached = redis.get(key)
  return cached if cached

  settings.morpheus.response(params[:word], params[:opts], :Latin).tap do |content|
    redis.set(key, content)
    redis.expire(key, Config::EXPIRY)
  end
end
