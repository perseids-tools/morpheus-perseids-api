module Parser
  class Word
    class Entry
      class Inflection
        class Mood
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<mood>#{content}</mood>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
