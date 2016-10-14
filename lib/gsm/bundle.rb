module Gsm
  class Bundle

    RUBY_GEM_URL = "https://rubygem.org".freeze

    def self.mirror(dst_url, src_url = RUBY_GEM_URL)
      `bundle config mirror.#{src_url} #{dst_url}`
    end

    def self.reset
      self.mirror(RUBY_GEM_URL)
    end
  end
end