require_relative '../../../utils'

require_relative './term/stem'
require_relative './term/suffix'

module Parser
  class Word
    class Entry
      class Inflection
        class Term
          # rubocop:disable Metrics/MethodLength
          # rubocop:disable Metrics/AbcSize
          def initialize(doc) # rubocop:disable Metrics/CyclomaticComplexity
            @language = doc['xml:lang']

            doc.xpath('./*').each do |element|
              case element.name
              when 'stem'
                @stem = Stem.new(element)
              when 'suff'
                @suffix = Suffix.new(element)
              when 'suff0'
                @suffix = Suffix.new(element)
              when 'suff1'
                @suffix = Suffix.new(element)
              when 'suff2'
                @suffix = Suffix.new(element)
              when 'suff3'
                @suffix = Suffix.new(element)
              when 'suff4'
                @suffix = Suffix.new(element)
              when 'suff5'
                @suffix = Suffix.new(element)
              when 'suff6'
                @suffix = Suffix.new(element)
              else
                raise Utils::NoMatchingClassError, element
              end
            end
          end
          # rubocop:enable Metrics/AbcSize
          # rubocop:enable Metrics/MethodLength

          def to_xml
            @to_xml ||= %(<term xml:lang="#{@language}">#{components.map(&:to_xml).join}</term>)
          end

          private

          def components
            [@stem, @suffix].compact
          end
        end
      end
    end
  end
end
