lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bc-drill-manager/version"

Gem::Specification.new do |spec|
  spec.name          = "bc-drill-manager"
  spec.version       = BcDrillManager::VERSION
  spec.authors       = ["Ribose Inc"]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Manage your organization's BC drill & drill reports with ease"
  spec.description   = "Manage your organization's BC drill & drill reports with ease"
  spec.homepage      = "https://github.com/riboseinc/bc-drill-manager"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
