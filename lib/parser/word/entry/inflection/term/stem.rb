module Parser
  class Word
    class Entry
      class Inflection
        class Term
          class Stem
            def initialize(doc)
              @content = doc.content
            end

            def to_xml
              @to_xml ||= "<stem>#{@content}</stem>"
            end
          end
        end
      end
    end
  end
end
