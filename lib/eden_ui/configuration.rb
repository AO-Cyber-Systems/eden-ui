module EdenUi
  class Configuration
    attr_accessor :app_name, :logo_path, :default_layout, :dark_mode,
                  :devise_views, :omniauth_providers, :sidebar_position,
                  :footer, :brand_color, :styleguide_enabled

    def initialize
      @app_name = "Eden"
      @logo_path = nil
      @default_layout = :app
      @dark_mode = true
      @devise_views = true
      @omniauth_providers = []
      @sidebar_position = :left
      @footer = true
      @brand_color = :gold
      @styleguide_enabled = Rails.env.development?
    end
  end
end
