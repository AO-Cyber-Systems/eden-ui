module EdenUi
  class Engine < ::Rails::Engine
    isolate_namespace EdenUi

    initializer "eden_ui.helpers" do
      ActiveSupport.on_load(:action_view) do
        include EdenUi::ComponentHelper
        include EdenUi::LayoutHelper
        include EdenUi::IconHelper
        include EdenUi::FormHelper
        include EdenUi::BrandHelper
        include EdenUi::LegacyHelper
        include EdenUi::StyleguideHelper
      end
    end

    initializer "eden_ui.importmap", before: "importmap" do |app|
      if app.config.respond_to?(:importmap)
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end
    end

    initializer "eden_ui.assets" do |app|
      if app.config.respond_to?(:assets)
        app.config.assets.paths << Engine.root.join("app/assets/stylesheets")
        app.config.assets.paths << Engine.root.join("app/assets/javascripts")
      end
    end

    initializer "eden_ui.devise_views" do
      if EdenUi.configuration.devise_views
        ActiveSupport.on_load(:action_controller) do
          prepend_view_path EdenUi::Engine.root.join("app/views")
        end
      end
    end
  end
end
