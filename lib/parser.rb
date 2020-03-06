require 'nokogiri'

require_relative './converter'
require_relative './parser/response'

class Parser
  def initialize(word, latin: false)
    @word = word
    @latin = latin
  end

  def bamboo_xml
    response.bamboo_xml
  end

  private

  attr_reader :word, :latin

  def morpheus_output
    @morpheus_output ||= Morpheus.raw(
      latin ? word : Converter.greek_to_beta_code(word),
      latin: latin,
      strict_case: false,
    )
  end

  def response
    @response ||= Response.new(word, Nokogiri::XML(morpheus_output), latin: latin)
  end
end
