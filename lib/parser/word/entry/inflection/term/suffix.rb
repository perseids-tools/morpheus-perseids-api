module Parser
  class Word
    class Entry
      class Inflection
        class Term
          class Suffix
            def initialize(doc)
              @content = doc.content
            end

            def to_xml
              @to_xml ||= "<suff>#{@content}</suff>"
            end
          end
        end
      end
    end
  end
end
