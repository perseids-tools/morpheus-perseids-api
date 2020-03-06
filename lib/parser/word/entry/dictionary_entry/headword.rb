require_relative '../../../../converter'

class Parser
  class Word
    class Entry
      class DictionaryEntry
        class Headword
          def initialize(doc)
            @language = doc['xml:lang']
            @content = doc.inner_html

            if language == 'grc-x-beta'
              @content = Converter.beta_code_to_greek(content)
              @language = 'grc'
            elsif language == 'lat'
              @content = Converter.latin_headword(content)
            end
          end

          def bamboo_xml
            @bamboo_xml ||= %(<hdwd xml:lang="#{language}">#{content}</hdwd>)
          end

          private

          attr_reader :language, :content
        end
      end
    end
  end
end
