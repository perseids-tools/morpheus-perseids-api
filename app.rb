require 'sinatra'
require 'sinatra/namespace'

require_relative './lib/config'
require_relative './lib/morpheus'
require_relative './lib/error'

set :protection, except: [:path_traversal]
set :morpheus, Morpheus.new
set :port, Config::PORT

namespace '/raw' do
  get '/greek/:word' do
    content_type :xml

    settings.morpheus.raw(word, **query_options)
  end

  get '/latin/:word' do
    content_type :xml

    settings.morpheus.raw(word, latin: true, **query_options)
  end
end

namespace '/analysis' do
  get '/word' do
    content_type :xml

    if !valid_engine?
      [404, Error.new('unknown engine').bamboo_xml]
    elsif !valid_language?
      [404, Error.new('unsupported language').bamboo_xml]
    else
      [201, settings.morpheus.bamboo_xml(word, latin: latin?)]
    end
  end
end

private

def word
  (params[:word] || '').unicode_normalize
end

def valid_engine?
  %w[morpheusgrc morpheuslat].member?(params[:engine])
end

def valid_language?
  %w[grc lat la].member?(params[:lang])
end

def latin?
  %w[lat la].member?(params[:lang])
end

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
