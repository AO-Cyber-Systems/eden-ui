module EdenUi
  module Generators
    class DeviseGenerator < Rails::Generators::Base
      source_root EdenUi::Engine.root.join("app/views/devise")

      desc "Copy Eden UI Devise views to your application for customization"

      def copy_devise_views
        directory ".", "app/views/devise"
      end

      def show_post_install
        say ""
        say "Eden UI Devise views copied to app/views/devise/", :green
        say "You can now customize these views to match your application."
        say ""
      end
    end
  end
end
