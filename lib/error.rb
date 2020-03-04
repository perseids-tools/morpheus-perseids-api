class Error
  def initialize(message)
    @message = message
  end

  def bamboo_xml
    "<error>#{message}</error>"
  end

  private

  attr_reader :message
end
