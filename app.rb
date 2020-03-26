require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/respond_with'

require_relative './lib/config'
require_relative './lib/morpheus'
require_relative './lib/parser'
require_relative './lib/error'

set :protection, except: [:path_traversal]
set :port, Config::PORT

namespace '/raw' do
  get '/greek/:word' do
    content_type :xml

    Morpheus.raw(word, **query_options)
  end

  get '/latin/:word' do
    content_type :xml

    Morpheus.raw(word, latin: true, **query_options)
  end
end

namespace '/analysis' do
  get '/word' do
    if !valid_engine?
      code = 404
      response = Error.new('unknown engine')
    elsif !valid_language?
      code = 404
      response = Error.new('unsupported language')
    else
      code = 201
      response = Parser.new(word, latin: latin?)
    end

    respond_to do |f|
      f.json { [code, response.bamboo_json] }
      f.xml { [code, response.bamboo_xml] }
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
