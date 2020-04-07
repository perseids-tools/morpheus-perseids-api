require 'nokogiri'

require_relative './morpheus'
require_relative './converter'
require_relative './parser/response'

class Parser
  def initialize(word, latin: false, strict_case: false)
    @word = word
    @latin = latin
    @strict_case = strict_case
  end

  def bamboo_xml
    response.bamboo_xml
  end

  def bamboo_json
    response.bamboo_json
  end

  private

  attr_reader :word, :latin, :strict_case

  def morpheus_output
    @morpheus_output ||= Morpheus.raw(
      latin ? Converter.latin_transform(word) : Converter.greek_to_beta_code(word),
      latin: latin,
      strict_case: strict_case,
    )
  end

  def response
    @response ||= Response.new(word, Nokogiri::XML(morpheus_output), latin: latin)
  end
end
