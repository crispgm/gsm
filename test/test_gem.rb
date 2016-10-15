require "helper"

class TestGem < Minitest::Test
  context "test gem" do
    context "init without yaml" do
      setup do
        system("rm test/conf/test.yml")
        @gem = Gsm::Gem.new("test/conf/test.yml")
      end
      
      should "load no use_name" do
        assert_equal("", @gem.use_name)
      end

      should "load sources from gem command" do
        if ENV["GSM_TEST_MODE"] == "CI"
          assert_equal({"Amethyst" => "https://rubygems.org/"}, @gem.sources)
        else
          assert_equal({"Amethyst" => "https://gems.ruby-china.org/"}, @gem.sources)
        end
      end

      should "use source" do
        @gem.use("Amethyst")
        outputs = `gem sources -l`
        if ENV["GSM_TEST_MODE"] == "CI"
          assert_equal("*** CURRENT SOURCES ***\n\nhttps://rubygems.org/\n", outputs)
        else
          assert_equal("*** CURRENT SOURCES ***\n\nhttps://gems.ruby-china.org/\n", outputs)
        end
      end

      context "add source" do
        should "return false when name is empty" do
          assert_equal(false, @gem.add("", ""))
        end

        should "return false when name is nil" do
          assert_equal(false, @gem.add(nil, ""))
        end

        should "return false when name's length is large than 32" do
          assert_equal(false, @gem.add("abcdefghijklmnopqrstuvwxyzqwertyu", ""))
        end

        should "return false when name exists" do
          assert_equal(false, @gem.add("Amethyst", ""))
        end

        should "return false when url is invalid" do
          assert_equal(false, @gem.add("Test", "http-://rubygems.org/"))
        end

        should "return name when succeed" do
          assert_equal("Test", @gem.add("Test", "https://rubygems.org/"))
          assert_equal(true, @gem.sources.has_key?("Test"))
          assert_equal("https://rubygems.org/", @gem.sources["Test"])
        end
      end

      teardown do
        system("rm test/conf/test.yml")
      end
    end

    context "init with good yaml" do
      setup do
        @gem = Gsm::Gem.new("test/conf/good.yml")
        system("cp test/conf/good.yml test/conf/good.yml.bak")
      end

      should "use_name be rubygems" do
        assert_equal("rubygems", @gem.use_name)
        assert_equal("rubygems", @gem.get)
      end
      
      should "list sources" do
        expect = {
          "rubygems" => "https://rubygems.org/",
          "rubychina" => "https://gems.ruby-china.org/",
          "rubytaobao" => "https://ruby.taobao.org/"
        }
        assert_equal(expect, @gem.sources)
      end

      should "return gem url in use when calling to_s" do
        assert_equal("https://rubygems.org/", @gem.to_s)
      end

      should "reset all data" do
        @gem.reset
        assert_empty(@gem.use_name)
        assert_empty(@gem.sources)
      end

      teardown do
        system("mv test/conf/good.yml.bak test/conf/good.yml")
      end
    end

    context "init with multiple local gem sources" do
    end
  end
end