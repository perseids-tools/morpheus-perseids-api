require 'nokogiri'
require 'beta_code'

require_relative './entry'

class Parser
  def initialize(xml)
    @doc = Nokogiri::XML(xml)
  end
end
