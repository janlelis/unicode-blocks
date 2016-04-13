require_relative "../lib/unicode/blocks"
require "minitest/autorun"

describe Unicode::Blocks do
  describe ".blocks (alias .of)" do
    it "will always return an Array" do
      assert_equal [], Unicode::Blocks.of("")
    end

    it "will return all blocks that characters in the string belong to" do
      assert_equal ["Basic Latin", "Cyrillic"], Unicode::Blocks.of("СC")
    end

    it "will return all blocks in sorted order" do
      assert_equal ["Basic Latin", "Cyrillic"], Unicode::Blocks.of("СA")
      assert_equal ["Basic Latin", "Cyrillic"], Unicode::Blocks.of("AС")
    end

    it "will call .block for every character" do
      mocked_method = MiniTest::Mock.new
      mocked_method.expect :call, "first block",  ["С"]
      mocked_method.expect :call, "second block", ["A"]
      Unicode::Blocks.stub :block, mocked_method do
        Unicode::Blocks.of("СA")
      end
      mocked_method.verify
    end
  end

  describe ".block" do
    it "will return block for that character" do
      assert_equal "Specials", Unicode::Blocks.block("�")
    end

    it "will return No_Block for characters not in any block" do
      assert_equal "No_Block", Unicode::Blocks.block("\u{10c50}")
    end
  end

  describe ".names" do
    it "will return a list of all block names" do
      assert_kind_of Array, Unicode::Blocks.names
      assert_includes Unicode::Blocks.names, "Ancient Symbols"
    end
  end
end

