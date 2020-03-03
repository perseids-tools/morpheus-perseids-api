require_relative './word/entry'
require_relative './word/form'

module Parser
  class Word
    def initialize(doc)
      @entries = doc.xpath('./entry').map { |i| Entry.new(i) }
      @forms = doc.xpath('./form').map { |i| Form.new(i) }
    end

    def bamboo_xml
      @bamboo_xml ||= entries.map(&:bamboo_xml).join("\n")
    end

    private

    attr_reader :entries, :forms
  end
end
