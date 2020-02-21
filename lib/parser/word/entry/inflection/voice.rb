module Parser
  class Word
    class Entry
      class Inflection
        class Voice
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<voice>#{@content}</voice>"
          end
        end
      end
    end
  end
end
