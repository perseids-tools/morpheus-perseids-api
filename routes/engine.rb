require_relative '../lib/engine_list'
require_relative '../lib/engine'
require_relative '../lib/error'

namespace '/engine' do
  get '' do
    code = 200
    response = EngineList.new

    respond_to do |f|
      f.json { [code, response.bamboo_json] }
      f.xml { [code, response.bamboo_xml] }
    end
  end

  get '/:engine' do
    if !valid_engine?
      code = 404
      response = Error.new('unknown engine')
    else
      code = 200
      response = Engine.new(engine)
    end

    respond_to do |f|
      f.json { [code, response.bamboo_json] }
      f.xml { [code, response.bamboo_xml] }
    end
  end
end

private

def engine
  params[:engine]
end

def valid_engine?
  %w[morpheusgrc morpheuslat].member?(params[:engine])
end
