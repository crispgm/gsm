require "helper"

class TestVersion < Minitest::Test
  context nil do
    should "return current version" do
      pass Gsm::VERSION
    end
  end
end