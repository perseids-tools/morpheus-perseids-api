require_relative '../../utils'

require_relative './inflection/term'
require_relative './inflection/part_of_speech'
require_relative './inflection/declension'
require_relative './inflection/case'
require_relative './inflection/gender'
require_relative './inflection/degree'
require_relative './inflection/mood'
require_relative './inflection/number'
require_relative './inflection/person'
require_relative './inflection/tense'
require_relative './inflection/voice'
require_relative './inflection/dialect'
require_relative './inflection/stem_type'
require_relative './inflection/derivation_type'
require_relative './inflection/morphology'

class Parser
  class Word
    class Entry
      class Inflection
        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def initialize(doc) # rubocop:disable Metrics/CyclomaticComplexity
          doc.xpath('./*').each do |element| # rubocop:disable Metrics/BlockLength
            case element.name
            when 'term'
              @term = Term.new(element)
            when 'pofs'
              @part_of_speech = PartOfSpeech.new(element)
            when 'decl'
              @declension = Declension.new(element)
            when 'case'
              @case = Case.new(element)
            when 'gend'
              @gender = Gender.new(element)
            when 'comp'
              @degree = Degree.new(element)
            when 'mood'
              @mood = Mood.new(element)
            when 'num'
              @number = Number.new(element)
            when 'pers'
              @person = Person.new(element)
            when 'tense'
              @tense = Tense.new(element)
            when 'voice'
              @voice = Voice.new(element)
            when 'dial'
              @dialect = Dialect.new(element)
            when 'stemtype'
              @stem_type = StemType.new(element)
            when 'derivtype'
              @derivation_type = DerivationType.new(element)
            when 'morph'
              @morphology = Morphology.new(element)
            else
              raise Utils::NoMatchingClassError, element
            end
          end
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength

        def bamboo_xml
          @bamboo_xml ||= %(<infl>#{components.map(&:bamboo_xml).join("\n")}</infl>)
        end

        def bamboo_json
          @bamboo_json ||= components.reduce({}) { |m, n| m.merge!(n.bamboo_json) }
        end

        private

        def components # rubocop:disable Metrics/MethodLength
          [
            @term,
            @part_of_speech,
            @declension,
            @case,
            @gender,
            @degree,
            @mood,
            @number,
            @person,
            @tense,
            @voice,
            @dialect,
            @stem_type,
            @derivation_type,
            @morphology,
          ].compact
        end
      end
    end
  end
end
