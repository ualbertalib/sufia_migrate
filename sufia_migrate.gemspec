# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.push lib
require 'sufia_migrate/version'

Gem::Specification.new do |spec|
  spec.name          = "sufia_migrate"
  spec.version       = SufiaMigrate::VERSION
  spec.authors       = ["Tricia Jenkins"]
  spec.email         = ["tricia.g.jenkins@gmail.com"]

  spec.summary       = "This is a first pass at exporting GenericFiles and Collections stored under a Sufia 6 implementation to a set of JSON files that can be used to import the data into a Sufia 7 implementation."
  spec.homepage      = 'https://github.com/ualbertalib/sufia_migrate'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.rdoc'] 
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
