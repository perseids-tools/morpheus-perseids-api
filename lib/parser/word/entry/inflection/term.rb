require_relative '../../../utils'

require_relative './term/stem'
require_relative './term/suffix'

class Parser
  class Word
    class Entry
      class Inflection
        class Term
          def initialize(doc) # rubocop:disable Metrics/MethodLength
            @language = doc['xml:lang']

            doc.xpath('./*').each do |element|
              case element.name
              when 'stem'
                @stem = Stem.new(language, element)
              when 'suff'
                @suffix = Suffix.new(language, element)
              else
                raise Utils::NoMatchingClassError, element
              end
            end

            @language = 'grc' if language == 'grc-x-beta'
          end

          def bamboo_xml
            @bamboo_xml ||= %(<term xml:lang="#{language}">#{components.map(&:bamboo_xml).join}</term>)
          end

          def bamboo_json
            @bamboo_json ||= {
              term: {
                lang: language,
              }.merge!(components.reduce({}) { |m, n| m.merge!(n.bamboo_json) }),
            }
          end

          private

          attr_reader :language, :stem, :suffix

          def components
            [stem, suffix].compact
          end
        end
      end
    end
  end
end
