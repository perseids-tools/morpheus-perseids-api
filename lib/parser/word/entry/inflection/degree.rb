module Parser
  class Word
    class Entry
      class Inflection
        class Degree
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<comp>#{@content}</comp>"
          end
        end
      end
    end
  end
end
