module Gsm
  module Util
    class << self
      require "colorize"

      def error(msg)
        puts "GSM Error: #{msg}".red
      end
    end
  end
end
