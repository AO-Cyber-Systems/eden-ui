module EdenUi
  module Generators
    class OverrideGenerator < Rails::Generators::Base
      desc "Copy an Eden UI component partial to your application for customization"

      argument :component, type: :string, desc: "Component name (e.g. alert, badge, button)"

      def copy_component
        source = EdenUi::Engine.root.join("app/views/eden_ui/components/_#{component}.html.erb")

        unless File.exist?(source)
          say "Component '#{component}' not found at #{source}", :red
          say ""
          say "Available components:"
          Dir[EdenUi::Engine.root.join("app/views/eden_ui/components/_*.html.erb")].sort.each do |path|
            name = File.basename(path, ".html.erb").delete_prefix("_")
            say "  #{name}"
          end
          raise Thor::Error, "Component '#{component}' does not exist."
        end

        destination = "app/views/eden_ui/components/_#{component}.html.erb"
        copy_file source, destination
        say "Copied #{component} component to #{destination}", :green
        say "Your local copy will take precedence over the gem version."
      end
    end
  end
end
