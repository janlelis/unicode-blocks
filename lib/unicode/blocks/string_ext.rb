require_relative "../blocks"

class String
  # Optional string extension for your convenience
  def unicode_blocks
    Unicode::Blocks.of(self)
  end
end
