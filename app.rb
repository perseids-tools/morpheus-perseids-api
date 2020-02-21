require 'sinatra'
require 'beta_code'

require_relative './lib/config'
require_relative './lib/morpheus'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new(Config::MORPHLIB, Config::EXECUTABLE, Config::EXPIRY)
set :port, Config::PORT

get '/greek/:word' do
  content_type :xml

  word = BetaCode.greek_to_beta_code(params[:word])
  settings.morpheus.response(word, **query_options)
end

get '/latin/:word' do
  content_type :xml

  word = params[:word]
  settings.morpheus.response(word, latin: true, **query_options)
end

private

def query_options
  params.slice(:strict_case, :verbs_only, :verbose).transform_values do |param|
    if param == 'true'
      true
    elsif param == 'false'
      false
    else
      nil
    end
  end.compact
end
