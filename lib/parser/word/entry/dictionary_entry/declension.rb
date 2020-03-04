module Parser
  class Word
    class Entry
      class DictionaryEntry
        class Declension
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<decl>#{content}</decl>"
          end

          private

          attr_reader :content
        end
      end
    end
  end
end
