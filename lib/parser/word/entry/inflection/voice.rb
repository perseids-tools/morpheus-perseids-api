module Parser
  class Word
    class Entry
      class Inflection
        class Voice
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<voice>#{content}</voice>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
