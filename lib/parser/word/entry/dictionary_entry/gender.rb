module Parser
  class Word
    class Entry
      class DictionaryEntry
        class Gender
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<gend>#{content}</gend>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
