module Parser
  class Word
    class Entry
      class Inflection
        class Number
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<num>#{content}</num>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
