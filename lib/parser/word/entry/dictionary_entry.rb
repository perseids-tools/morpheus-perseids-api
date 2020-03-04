require_relative '../../utils'

require_relative './dictionary_entry/headword'
require_relative './dictionary_entry/part_of_speech'
require_relative './dictionary_entry/declension'
require_relative './dictionary_entry/gender'

module Parser
  class Word
    class Entry
      class DictionaryEntry
        def initialize(doc) # rubocop:disable Metrics/MethodLength
          doc.xpath('./*').each do |element|
            case element.name
            when 'hdwd'
              @headword = Headword.new(element)
            when 'pofs'
              @part_of_speech = PartOfSpeech.new(element)
            when 'decl'
              @declension = Declension.new(element)
            when 'gend'
              @gender = Gender.new(element)
            else
              raise Utils::NoMatchingClassError, element
            end
          end
        end

        def bamboo_xml
          @bamboo_xml ||= %(<dict>#{components.map(&:bamboo_xml).join("\n")}</dict>)
        end

        private

        attr_reader :headword, :part_of_speech, :declension, :gender

        def components
          [headword, part_of_speech, declension, gender].compact
        end
      end
    end
  end
end
