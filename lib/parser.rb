require 'nokogiri'

require_relative './parser/response'

module Parser
  def self.parse(xml)
    doc = Nokogiri::XML(xml)

    Response.new(doc).to_xml
  end
end
