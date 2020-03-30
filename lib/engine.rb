class Engine
  def initialize(engine)
    @engine = engine
  end

  def bamboo_xml
    @bamboo_xml ||= <<~XML
      <enginelist>
        #{engine_xml}
      </enginelist>
    XML
  end

  def engine_xml
    @engine_xml ||= <<~XML
      <engine code="#{engine}">
        <supportsLanguageCode>grc</supportsLanguageCode>
        <supportsLanguageCode>la</supportsLanguageCode>
        <supportsLanguageCode>lat</supportsLanguageCode>
        <supportsOption>strictCase=^1$</supportsOption>
      </engine>
    XML
  end

  def bamboo_json
    {
      enginelist: {
        engine: engine_json,
      },
    }.to_json
  end

  def engine_json
    @engine_json ||= {
      code: engine,
      supportsLanguageCode: [
        { '$': 'grc' },
        { '$': 'la' },
        { '$': 'lat' },
      ],
      supportsOption: { '$': 'strictCase=^1$' },
    }
  end

  private

  attr_reader :engine
end
