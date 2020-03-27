class Parser
  class Word
    class Entry
      class DictionaryEntry
        class Declension
          def initialize(doc)
            @content = doc.inner_html
          end

          def bamboo_xml
            @bamboo_xml ||= "<decl>#{content}</decl>"
          end

          def bamboo_json
            @bamboo_json ||= {
              decl: {
                '$': unescaped_content,
              },
            }
          end

          private

          attr_reader :content

          # Declension can have an &amp; in it
          def unescaped_content
            @unescaped_content ||= CGI.unescapeHTML(content)
          end
        end
      end
    end
  end
end
