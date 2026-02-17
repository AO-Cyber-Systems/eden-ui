require_relative "lib/eden_ui/version"

Gem::Specification.new do |spec|
  spec.name        = "eden_ui"
  spec.version     = EdenUi::VERSION
  spec.authors     = ["Eden"]
  spec.summary     = "Comprehensive UI component library for Eden Rails apps"
  spec.description = "Rails engine providing Flowbite-based ERB components, layout systems, Devise views, and Stimulus controllers for the Eden app ecosystem"
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 3.1"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,lib}/**/*", "Gemfile", "Rakefile", "eden_ui.gemspec", "LICENSE"]
  end

  spec.add_dependency "rails", ">= 7.1"
end
