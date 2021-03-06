require_relative 'lib/meraki_webhooks/version'

Gem::Specification.new do |spec|
  spec.name          = "meraki_webhooks"
  spec.version       = MerakiWebhooks::VERSION
  spec.authors       = ["Julian Cheal"]
  spec.email         = ["julian.cheal@gmail.com"]

  spec.summary       = "Meraki Webhook Payload Parser"
  spec.description   = "Meraki Webhook Payload Parser"
  spec.homepage      = "https://github.com/juliancheal/meraki_webhooks"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/juliancheal/meraki_webhooks"
  spec.metadata["changelog_uri"] = "https://github.com/juliancheal/meraki_webhooks/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "http"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "dry-struct"
end
