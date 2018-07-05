require 'sinatra'
require './lib/morpheus'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new('../morpheus-perseids-2/stemlib', '../morpheus-perseids-2/bin/cruncher')

get "/greek/:word" do
  settings.morpheus.response(params[:word], params[:opts], :Greek)
end

get "/latin/:word" do
  settings.morpheus.response(params[:word], params[:opts], :Latin)
end
