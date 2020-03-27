class Parser
  class Word
    class Entry
      class DictionaryEntry
        class PartOfSpeech
          def initialize(doc)
            @order = doc['order']
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= %(<pofs order="#{order}">#{content}</pofs>)
          end

          def bamboo_json
            @bamboo_json ||= {
              pofs: {
                order: order.to_i,
                '$': content,
              },
            }
          end

          private

          attr_reader :order, :content
        end
      end
    end
  end
end
