class Parser
  class Word
    class Entry
      class Inflection
        class Case
          def initialize(doc)
            @order = doc['order']
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= %(<case order="#{order}">#{content}</case>)
          end

          private

          attr_reader :order, :content
        end
      end
    end
  end
end
