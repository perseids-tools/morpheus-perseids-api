require 'sinatra'
require 'sinatra/namespace'
require 'beta_code'

require_relative './lib/config'
require_relative './lib/morpheus'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new
set :port, Config::PORT

namespace '/raw' do
  get '/greek/:word' do
    content_type :xml

    word = params[:word]
    settings.morpheus.raw(word, **query_options)
  end

  get '/latin/:word' do
    content_type :xml

    word = params[:word]
    settings.morpheus.raw(word, latin: true, **query_options)
  end
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
  end.compact.to_h.transform_keys(&:to_sym)
end
