require_relative './word/entry'
require_relative './word/form'

class Parser
  class Word
    def initialize(doc)
      @entries = doc.xpath('./entry').map { |i| Entry.new(i) }
      @forms = doc.xpath('./form').map { |i| Form.new(i) }
    end

    def bamboo_xml
      @bamboo_xml ||= entries.map(&:bamboo_xml).join("\n")
    end

    attr_reader :entries

    private

    attr_reader :forms
  end
end
