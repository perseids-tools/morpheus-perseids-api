module Parser
  class Word
    class Entry
      class Inflection
        class Gender
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<gend>#{@content}</gend>"
          end
        end
      end
    end
  end
end
