module Parser
  class Word
    class Entry
      class Inflection
        class Morphology
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<morph>#{@content}</morph>"
          end
        end
      end
    end
  end
end
