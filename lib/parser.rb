require 'nokogiri'

require_relative './parser/response'

module Parser
  def self.bamboo_xml(word, latin, xml)
    Response.new(word, latin, Nokogiri::XML(xml)).bamboo_xml
  end
end
