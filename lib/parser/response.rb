require_relative './word'
require_relative './unknown'

module Parser
  class Response
    def initialize(doc)
      @words = doc.xpath('./words/word').map { |w| Word.new(w) }
      @unknowns = doc.xpath('./words/unknown').map { |u| Unknown.new(u) }
    end

    def to_xml
      @to_xml ||= "<words>\n#{components.map(&:to_xml).join}</words>"
    end

    private

    def components
      @words + @unknowns
    end
  end
end
