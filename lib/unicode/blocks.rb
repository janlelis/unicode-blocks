require_relative "blocks/constants"

module Unicode
  module Blocks
    def self.blocks(string)
      res = []
      string.each_char do |char|
        block_name = block(char)
        res << block_name unless res.include?(block_name)
      end
      res.sort
    end
    class << self; alias of blocks; end

    def self.blocks_counted(string)
      string.each_char.with_object({}) do |char, res|
        block_name = block(char)
        res[block_name] ||= 0
        res[block_name] += 1
      end
    end

    def self.block(char)
      require_relative 'blocks/index' unless defined? ::Unicode::Blocks::INDEX
      codepoint = char.unpack("U")[0] or raise(ArgumentError, "Unicode::Blocks.block must be given a valid char")
      block_info = INDEX.bsearch{ |block_info| codepoint <= block_info[1] }
      codepoint >= block_info[0] ? block_info[2] : "No_Block"
    end

    def self.names
      require_relative 'blocks/index' unless defined? ::Unicode::Blocks::INDEX
      INDEX.map(&:last)
    end
  end
end

