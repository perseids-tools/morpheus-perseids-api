module Parser
  class Word
    class Entry
      class Inflection
        class Tense
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<tense>#{@content}</tense>"
          end
        end
      end
    end
  end
end
