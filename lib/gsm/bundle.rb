module Gsm
  module Bundle
    class << self

      RUBY_GEM_URL = "https://rubygems.org/".freeze

      def mirror(dst_url, src_url = RUBY_GEM_URL)
        `bundle config mirror.#{src_url} #{dst_url}`
      end

      def reset
        self.mirror(RUBY_GEM_URL)
      end
    end
  end
end
