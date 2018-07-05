require 'sinatra'
require './lib/config'
require './lib/morpheus'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new(Config::MORPHLIB, Config::EXECUTABLE)
set :port, Config::PORT

get "/greek/:word" do
  settings.morpheus.response(params[:word], params[:opts], :Greek)
end

get "/latin/:word" do
  settings.morpheus.response(params[:word], params[:opts], :Latin)
end
