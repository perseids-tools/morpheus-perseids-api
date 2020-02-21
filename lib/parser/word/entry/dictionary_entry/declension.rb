module Parser
  class Word
    class Entry
      class DictionaryEntry
        class Declension
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<decl>#{@content}</decl>"
          end
        end
      end
    end
  end
end
