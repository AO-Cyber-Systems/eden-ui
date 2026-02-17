module EdenUi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Install Eden UI into your Rails application"

      def create_initializer
        template "initializer.rb.tt", "config/initializers/eden_ui.rb"
      end

      def add_css_imports
        css_file = "app/assets/stylesheets/application.css"

        if File.exist?(css_file)
          imports = <<~CSS

            /* Eden UI */
            @import "eden_ui/tokens";
            @import "eden_ui/theme";
            @import "eden_ui/animations";
          CSS

          append_to_file css_file, imports
        else
          say "Could not find #{css_file}. Please add Eden UI CSS imports manually:", :yellow
          say '  @import "eden_ui/tokens";'
          say '  @import "eden_ui/theme";'
          say '  @import "eden_ui/animations";'
        end
      end

      def register_stimulus_controllers
        js_entry = "app/javascript/controllers/index.js"

        if File.exist?(js_entry)
          registration = File.read(File.expand_path("templates/stimulus_index.js.tt", __dir__))
          append_to_file js_entry, "\n#{registration}"
        else
          say "Could not find #{js_entry}. Please register Eden UI Stimulus controllers manually.", :yellow
          say "Run: rails generate eden_ui:install for the registration code."
        end
      end

      def show_post_install
        say ""
        say "Eden UI installed successfully!", :green
        say ""
        say "Next steps:"
        say "  1. Configure Eden UI in config/initializers/eden_ui.rb"
        say "  2. Run `rails generate eden_ui:devise` to install Devise views (optional)"
        say "  3. Restart your Rails server"
        say ""
      end
    end
  end
end
