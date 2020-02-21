module Parser
  class Unknown
    def initialize(doc)
      @content = doc.content
      @language = doc['xml:lang']
    end

    def to_xml
      @to_xml ||= %(<unknown xml:lang="#{@language}">#{@content}</unknown>\n)
    end
  end
end
