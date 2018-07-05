require 'sinatra'

set :protection, except: [:path_traversal]

get "/greek/:word" do
  params[:word]
end

get "/latin/:word" do
  params[:word]
end
