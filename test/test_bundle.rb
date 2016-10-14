require "helper"

class TestBundle < Minitest::Test
  context "Test bundle" do
    should "mirror to url" do
      Gsm::Bundle.mirror("https://gems.ruby-china.org/", "https://rubygems.org/")
      output = get_bundle_mirror_config
      assert_equal(true, output.end_with?("\"https://gems.ruby-china.org/\""))
    end

    should "reset to default url" do
      Gsm::Bundle.reset
      output = get_bundle_mirror_config
      assert_equal(true, output.end_with?("\"https://rubygems.org/\""))
    end
  end
end