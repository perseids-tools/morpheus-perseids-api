module Parser
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

          private

          attr_reader :order, :content
        end
      end
    end
  end
end
