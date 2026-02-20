module EdenUi
  class Configuration
    attr_accessor :app_name, :logo_path, :default_layout, :dark_mode,
                  :devise_views, :omniauth_providers, :sidebar_position,
                  :footer, :brand_color, :font_preset, :styleguide_enabled

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
      @font_preset = :default
      @styleguide_enabled = Rails.env.development?
    end

    def resolved_colors
      BrandPresets.resolve_colors(@brand_color)
    end

    def resolved_fonts
      BrandPresets.resolve_fonts(@font_preset)
    end
  end
end
