require_relative './engine'

class EngineList
  def bamboo_xml
    @bamboo_xml ||= <<~XML
      <enginelist>
        #{engines.map(&:engine_xml).join("\n")}
      </enginelist>
    XML
  end

  def bamboo_json
    {
      enginelist: {
        engine: engines.map(&:engine_json),
      },
    }.to_json
  end

  private

  def engines
    @engines ||= [
      Engine.new('morpheusgrc'),
      Engine.new('morpheuslat'),
    ]
  end
end
