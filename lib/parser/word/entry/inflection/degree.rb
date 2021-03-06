class Parser
  class Word
    class Entry
      class Inflection
        class Degree
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<comp>#{content}</comp>"
          end

          def bamboo_json
            @bamboo_json ||= {
              comp: {
                '$': content,
              },
            }
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
