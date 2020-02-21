module Parser
  class Word
    class Entry
      class Inflection
        class Dialect
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<dial>#{@content}</dial>"
          end
        end
      end
    end
  end
end
