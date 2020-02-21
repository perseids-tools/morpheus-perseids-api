module Parser
  class Word
    class Entry
      class Inflection
        class DerivationType
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<derivtype>#{@content}</derivtype>"
          end
        end
      end
    end
  end
end
