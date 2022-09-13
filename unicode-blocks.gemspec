# -*- encoding: utf-8 -*-

require File.dirname(__FILE__) + "/lib/unicode/blocks/constants"

Gem::Specification.new do |gem|
  gem.name          = "unicode-blocks"
  gem.version       = Unicode::Blocks::VERSION
  gem.summary       = "Return Unicode blocks of a string."
  gem.description   = "[Unicode #{Unicode::Blocks::UNICODE_VERSION}] Answers the question: Which Unicode block does a code point belong to?"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/unicode-blocks"
  gem.license       = "MIT"

  gem.files         = Dir["{**/}{.*,*}"].select{ |path| File.file?(path) && path !~ /^pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.metadata      = { "rubygems_mfa_required" => "true" }

  gem.required_ruby_version = ">= 2.0"
end
