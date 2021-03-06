class Parser
  class Word
    class Entry
      class Inflection
        class Morphology
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<morph>#{content}</morph>"
          end

          def bamboo_json
            @bamboo_json ||= {
              morph: {
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
