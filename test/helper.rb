require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require "minitest/autorun"
require "shoulda-context"
require "gsm"

def get_bundle_mirror_config
  outputs = `bundle config`
  config_line = ""
  lines = outputs.split("\n")
  lines.each_index do |idx|
    if lines[idx].eql?("mirror.https://rubygems.org/")
      config_line = lines[(idx+1)]
    end
  end
  config_line
end