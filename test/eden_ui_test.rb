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
end
