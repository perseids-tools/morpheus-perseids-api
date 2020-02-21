module Parser
  class Word
    class Entry
      class Inflection
        class Mood
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<mood>#{@content}</mood>"
          end
        end
      end
    end
  end
end
