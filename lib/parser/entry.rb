class Parser
  module Value
    def initialize(value)
      @value = value
    end

    def value
      @value
    end
  end

  module Order
    def initialize(order, value)
      @order = order
      @value = value
    end

    def order
      @order
    end

    def value
      @value
    end
  end

  module Lang
    def initialize(lang, value)
      if lang == 'grc-x-beta'
        @lang = 'grc'
        @value = BetaCode.beta_code_to_greek(value)
      else
        @lang = lang
        @value = value
      end
    end

    def lang
      @lang
    end

    def value
      @value
    end
  end

  class Entry
    class DictionaryEntry
      class Headword
        include Lang
      end

      class PartOfSpeech
        include Order
      end

      class Declension
        include Value
      end

      class Gender
        include Value
      end
    end

    class Inflection
      class Term
        class Stem
          include Value
        end

        class Suffix
          include Value
        end
      end

      class PartOfSpeech
        include Order
      end

      class Declension
        include Value
      end

      class Case
        include Order
      end

      class Gender
        include Value
      end

      class Degree
        include Value
      end

      class Mood
        include Value
      end

      class Number
        include Value
      end

      class Person
        include Value
      end

      class Tense
        include Value
      end

      class Voice
        include Value
      end

      class Number
        include Value
      end

      class Geography
        include Value
      end

      class Dialect
        include Value
      end

      class StemType
        include Value
      end

      class DerivationType
        include Value
      end

      class Morphology
        include Value
      end
    end
  end
end
