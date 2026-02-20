require "test_helper"

class EdenUiTest < Minitest::Test
  def test_version
    refute_nil EdenUi::VERSION
  end

  def test_configuration_defaults
    config = EdenUi::Configuration.new
    assert_equal "Eden", config.app_name
    assert_nil config.logo_path
    assert_equal :app, config.default_layout
    assert config.dark_mode
    assert config.devise_views
    assert_equal [], config.omniauth_providers
    assert_equal :left, config.sidebar_position
    assert config.footer
    assert_equal :gold, config.brand_color
    assert_equal :default, config.font_preset
  end

  def test_configure_block
    EdenUi.configure do |config|
      config.app_name = "TestApp"
      config.dark_mode = false
      config.devise_views = false
      config.omniauth_providers = [:google_oauth2]
    end

    assert_equal "TestApp", EdenUi.configuration.app_name
    refute EdenUi.configuration.dark_mode
    refute EdenUi.configuration.devise_views
    assert_equal [:google_oauth2], EdenUi.configuration.omniauth_providers
  ensure
    EdenUi.reset_configuration!
  end

  def test_reset_configuration
    EdenUi.configure { |c| c.app_name = "Changed" }
    EdenUi.reset_configuration!
    assert_equal "Eden", EdenUi.configuration.app_name
  end

  def test_resolved_colors_default
    config = EdenUi::Configuration.new
    colors = config.resolved_colors
    assert_equal "#d4a853", colors[500]
  end

  def test_resolved_colors_with_preset
    config = EdenUi::Configuration.new
    config.brand_color = :blue
    colors = config.resolved_colors
    assert_equal "#3b82f6", colors[500]
  end

  def test_resolved_fonts_default
    config = EdenUi::Configuration.new
    fonts = config.resolved_fonts
    assert_includes fonts[:display], "Outfit"
  end

  def test_resolved_fonts_with_preset
    config = EdenUi::Configuration.new
    config.font_preset = :system
    fonts = config.resolved_fonts
    assert_includes fonts[:display], "system-ui"
    assert_nil fonts[:google_fonts_url]
  end

  def test_configure_brand_color
    EdenUi.configure { |c| c.brand_color = :purple }
    assert_equal :purple, EdenUi.configuration.brand_color
    assert_equal "#a855f7", EdenUi.configuration.resolved_colors[500]
  ensure
    EdenUi.reset_configuration!
  end

  def test_configure_font_preset
    EdenUi.configure { |c| c.font_preset = :inter }
    assert_equal :inter, EdenUi.configuration.font_preset
    assert_includes EdenUi.configuration.resolved_fonts[:display], "Inter"
  ensure
    EdenUi.reset_configuration!
  end
end
