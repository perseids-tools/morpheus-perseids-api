module Parser
  class Word
    class Entry
      class DictionaryEntry
        class PartOfSpeech
          def initialize(doc)
            @content = doc.content
            @order = doc['order']
          end

          def to_xml
            @to_xml ||= %(<pofs order="#{@order}">#{@content}</pofs>)
          end
        end
      end
    end
  end
end
