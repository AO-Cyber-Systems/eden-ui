require "test_helper"

class BrandPresetsTest < Minitest::Test
  def test_resolve_gold_preset
    colors = EdenUi::BrandPresets.resolve_colors(:gold)
    assert_equal "#d4a853", colors[500]
    assert_equal "212, 168, 83", colors[:rgb_500]
  end

  def test_resolve_blue_preset
    colors = EdenUi::BrandPresets.resolve_colors(:blue)
    assert_equal "#3b82f6", colors[500]
    assert_equal "59, 130, 246", colors[:rgb_500]
  end

  def test_resolve_emerald_preset
    colors = EdenUi::BrandPresets.resolve_colors(:emerald)
    assert_equal "#10b981", colors[500]
  end

  def test_resolve_purple_preset
    colors = EdenUi::BrandPresets.resolve_colors(:purple)
    assert_equal "#a855f7", colors[500]
  end

  def test_resolve_red_preset
    colors = EdenUi::BrandPresets.resolve_colors(:red)
    assert_equal "#ef4444", colors[500]
  end

  def test_resolve_slate_preset
    colors = EdenUi::BrandPresets.resolve_colors(:slate)
    assert_equal "#64748b", colors[500]
  end

  def test_resolve_string_key
    colors = EdenUi::BrandPresets.resolve_colors("blue")
    assert_equal "#3b82f6", colors[500]
  end

  def test_resolve_unknown_preset_raises
    assert_raises(ArgumentError) { EdenUi::BrandPresets.resolve_colors(:neon) }
  end

  def test_resolve_custom_hash
    custom = EdenUi::BrandPresets::SHADES.each_with_object({}) { |s, h| h[s] = "##{s.to_s.ljust(6, '0')}" }
    custom[:rgb_500] = "1, 2, 3"
    colors = EdenUi::BrandPresets.resolve_colors(custom)
    assert_equal "1, 2, 3", colors[:rgb_500]
  end

  def test_custom_hash_missing_shade_raises
    custom = { 50 => "#fff", rgb_500: "0,0,0" }
    assert_raises(ArgumentError) { EdenUi::BrandPresets.resolve_colors(custom) }
  end

  def test_custom_hash_missing_rgb_raises
    custom = EdenUi::BrandPresets::SHADES.each_with_object({}) { |s, h| h[s] = "#000" }
    assert_raises(ArgumentError) { EdenUi::BrandPresets.resolve_colors(custom) }
  end

  def test_nil_falls_back_to_gold
    colors = EdenUi::BrandPresets.resolve_colors(nil)
    assert_equal "#d4a853", colors[500]
  end

  def test_all_presets_have_all_shades
    EdenUi::BrandPresets::PRESETS.each do |name, palette|
      EdenUi::BrandPresets::SHADES.each do |shade|
        assert palette.key?(shade), "Preset #{name} missing shade #{shade}"
      end
      assert palette.key?(:rgb_500), "Preset #{name} missing :rgb_500"
    end
  end

  # Font preset tests

  def test_resolve_default_fonts
    fonts = EdenUi::BrandPresets.resolve_fonts(:default)
    assert_includes fonts[:display], "Outfit"
    assert_includes fonts[:body], "Plus Jakarta Sans"
    assert_includes fonts[:mono], "JetBrains Mono"
    assert fonts[:google_fonts_url]
  end

  def test_resolve_inter_fonts
    fonts = EdenUi::BrandPresets.resolve_fonts(:inter)
    assert_includes fonts[:display], "Inter"
    assert_includes fonts[:body], "Inter"
    assert fonts[:google_fonts_url]
  end

  def test_resolve_system_fonts
    fonts = EdenUi::BrandPresets.resolve_fonts(:system)
    assert_includes fonts[:display], "system-ui"
    assert_nil fonts[:google_fonts_url]
  end

  def test_resolve_font_string_key
    fonts = EdenUi::BrandPresets.resolve_fonts("inter")
    assert_includes fonts[:display], "Inter"
  end

  def test_resolve_unknown_font_raises
    assert_raises(ArgumentError) { EdenUi::BrandPresets.resolve_fonts(:comic_sans) }
  end

  def test_resolve_custom_font_hash
    custom = { display: "Custom", body: "Custom", mono: "Mono", google_fonts_url: nil }
    fonts = EdenUi::BrandPresets.resolve_fonts(custom)
    assert_equal "Custom", fonts[:display]
  end

  def test_nil_font_falls_back_to_default
    fonts = EdenUi::BrandPresets.resolve_fonts(nil)
    assert_includes fonts[:display], "Outfit"
  end
end
