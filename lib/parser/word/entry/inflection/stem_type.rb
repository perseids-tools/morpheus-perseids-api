module Parser
  class Word
    class Entry
      class Inflection
        class StemType
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<stemtype>#{@content}</stemtype>"
          end
        end
      end
    end
  end
end
