class Error
  def initialize(message)
    @message = message
  end

  def bamboo_xml
    @bamboo_xml ||= "<error>#{message}</error>"
  end

  def bamboo_json
    @bamboo_json ||= {
      error: {
        '$': message,
      },
    }
  end

  private

  attr_reader :message
end
