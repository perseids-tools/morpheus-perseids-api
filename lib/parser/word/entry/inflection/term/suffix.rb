require_relative '../../../../../converter'

module Parser
  class Word
    class Entry
      class Inflection
        class Term
          class Suffix
            def initialize(language, doc)
              @content = doc.inner_html

              @content = Converter.beta_code_to_greek(content) if language == 'grc-x-beta'
            end

            def bamboo_xml
              @bamboo_xml ||= "<suff>#{content}</suff>"
            end

            private

            attr_reader :content
          end
        end
      end
    end
  end
end
