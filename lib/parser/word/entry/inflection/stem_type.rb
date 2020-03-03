module Parser
  class Word
    class Entry
      class Inflection
        class StemType
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<stemtype>#{content}</stemtype>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
