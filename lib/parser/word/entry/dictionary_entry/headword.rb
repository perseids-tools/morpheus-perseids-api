module Parser
  class Word
    class Entry
      class DictionaryEntry
        class Headword
          def initialize(doc)
            @content = doc.content
            @language = doc['xml:lang']
          end

          def to_xml
            @to_xml ||= %(<hdwd xml:lang="#{@language}">#{@content}</hdwd>)
          end
        end
      end
    end
  end
end
