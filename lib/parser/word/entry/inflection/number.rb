module Parser
  class Word
    class Entry
      class Inflection
        class Number
          def initialize(doc)
            @content = doc.content
          end

          def to_xml
            @to_xml ||= "<num>#{@content}</num>"
          end
        end
      end
    end
  end
end
