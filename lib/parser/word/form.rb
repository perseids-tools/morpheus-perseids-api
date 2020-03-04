module Parser
  class Word
    class Form
      def initialize(doc)
        @language = doc['xml:lang']
        @content = doc.inner_html
      end

      def bamboo_xml
        @bamboo_xml ||= %(<form xml:lang="#{language}">#{content}</form>\n)
      end

      private

      attr_reader :language, :content
    end
  end
end
