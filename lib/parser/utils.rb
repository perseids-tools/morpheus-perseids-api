module Parser
  module Utils
    class NoMatchingClassError < StandardError
      def initialize(element)
        super("No class found that matches `#{element.name}`")
      end
    end
  end
end
