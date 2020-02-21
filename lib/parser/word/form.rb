module Parser
  class Word
    class Form
      def initialize(doc)
        @content = doc.content
        @language = doc['xml:lang']
      end

      def to_xml
        @to_xml ||= %(<form xml:lang="#{@language}">#{@content}</form>\n)
      end
    end
  end
end
