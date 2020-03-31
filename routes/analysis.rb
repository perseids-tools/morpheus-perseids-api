require_relative '../lib/parser'
require_relative '../lib/error'

namespace '/analysis' do
  responder = lambda do
    if !valid_engine?
      code = 404
      response = Error.new('unknown engine')
    elsif !valid_language?
      code = 404
      response = Error.new('unsupported language')
    else
      code = 201
      response = Parser.new(word, latin: latin?, strict_case: strict_case?)
    end

    respond_to do |f|
      f.json { [code, response.bamboo_json] }
      f.xml { [code, response.bamboo_xml] }
    end
  end

  get '/word', &responder
  post '/word', &responder
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

def strict_case?
  params[:strictCase] == '1'
end
