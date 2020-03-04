module Parser
  class Word
    class Entry
      class Inflection
        class Dialect
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<dial>#{content}</dial>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
