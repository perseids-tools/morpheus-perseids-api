require_relative '../../../../../converter'

class Parser
  class Word
    class Entry
      class Inflection
        class Term
          class Stem
            def initialize(language, doc)
              @content = doc.inner_html

              @content = Converter.beta_code_to_greek(content) if language == 'grc-x-beta'
            end

            def bamboo_xml
              @bamboo_xml ||= "<stem>#{content}</stem>"
            end

            def bamboo_json
              @bamboo_json ||= {
                stem: {
                  '$': content,
                },
              }
            end

            private

            attr_reader :content
          end
        end
      end
    end
  end
end
