module Unicode
  module Blocks
    VERSION = "1.2.1".freeze
    UNICODE_VERSION = "10.0.0".freeze
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + '/../../../data/').freeze
    INDEX_FILENAME = (DATA_DIRECTORY + '/blocks.marshal.gz').freeze
  end
end

