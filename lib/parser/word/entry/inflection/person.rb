module Parser
  class Word
    class Entry
      class Inflection
        class Person
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= %(<pers>#{@content}</pers>)
          end
        end
      end
    end
  end
end
