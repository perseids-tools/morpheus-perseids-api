class Parser
  class Word
    class Entry
      class Inflection
        class Tense
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<tense>#{content}</tense>"
          end

          def bamboo_json
            @bamboo_json ||= {
              tense: {
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
