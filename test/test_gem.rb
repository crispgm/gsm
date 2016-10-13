require "helper"

class TestGem < Minitest::Test
  context nil do
    context "init without yaml" do
      setup do
        system("rm test/conf/test.yml")
        @gem = Gsm::Gem.new("test/conf/test.yml")
      end
      
      should "load nothing" do
        assert_equal("", @gem.use_name)
      end

      should "load with gem command" do
        assert_equal({"Amethyst" => "https://rubygems.org"}, @gem.sources)
      end

      teardown do
        system("rm test/conf/test.yml")
      end
    end
  end
end