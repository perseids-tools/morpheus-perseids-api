module Parser
  class Word
    class Entry
      class Inflection
        class Case
          def initialize(doc)
            @content = doc.content
            @order = doc['order']
          end

          def to_xml
            @to_xml ||= %(<case order="#{@order}">#{@content}</case>)
          end
        end
      end
    end
  end
end
