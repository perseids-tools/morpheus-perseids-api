class Parser
  class Unknown
    def initialize(doc)
      @content = doc.inner_html
      @language = doc['xml:lang']
    end

    def bamboo_xml
      @bamboo_xml ||= ''
    end

    def bamboo_json
      @bamboo_json ||= {}
    end
  end
end
