# frozen_string_literal: true

module Unicode
  module Blocks
    VERSION = "1.4.0"
    UNICODE_VERSION = "12.1.0"
    DATA_DIRECTORY = File.expand_path(File.dirname(__FILE__) + "/../../../data/").freeze
    INDEX_FILENAME = (DATA_DIRECTORY + "/blocks.marshal.gz").freeze
  end
end
