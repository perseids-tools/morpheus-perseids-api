require_relative './entry/dictionary_entry'
require_relative './entry/inflection'

module Parser
  class Word
    class Entry
      def initialize(doc)
        @dictionary_entries = doc.xpath('./dict').map { |d| DictionaryEntry.new(d) }
        @inflections = doc.xpath('./infl').map { |i| Inflection.new(i) }
      end

      def to_xml
        @to_xml ||= %(<entry>#{components.map(&:to_xml).join("\n")}</entry>\n)
      end

      private

      def components
        @dictionary_entries + @inflections
      end
    end
  end
end
