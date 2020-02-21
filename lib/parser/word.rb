require_relative './word/entry'
require_relative './word/form'

module Parser
  class Word
    def initialize(doc)
      @forms = doc.xpath('./form').map { |d| Form.new(d) }
      @entries = doc.xpath('./entry').map { |i| Entry.new(i) }
    end

    def to_xml
      @to_xml ||= %(<word>\n#{components.map(&:to_xml).join}</word>\n)
    end

    private

    def components
      @forms + @entries
    end
  end
end
