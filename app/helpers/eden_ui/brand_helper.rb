module EdenUi
  module BrandHelper
    def eden_brand_style_tag
      config = EdenUi.configuration
      colors = config.resolved_colors

      # No-op for gold — the CSS defaults already point to gold
      return "".html_safe if config.brand_color.to_sym == :gold

      css = BrandPresets::SHADES.map { |s| "  --eden-primary-#{s}: #{colors[s]};" }.join("\n")
      css << "\n  --eden-primary-rgb-500: #{colors[:rgb_500]};"

      tag.style(":root {\n#{css}\n}".html_safe)
    end

    def eden_font_tags
      fonts = EdenUi.configuration.resolved_fonts
      url = fonts[:google_fonts_url]

      parts = [
        tag.link(rel: "preconnect", href: "https://fonts.googleapis.com"),
        tag.link(rel: "preconnect", href: "https://fonts.gstatic.com", crossorigin: "anonymous")
      ]

      if url
        parts << tag.link(href: url, rel: "stylesheet")
      end

      # Emit font overrides if not using the default preset
      unless EdenUi.configuration.font_preset.to_sym == :default
        css = [
          "  --eden-font-display: #{fonts[:display]};",
          "  --eden-font-body: #{fonts[:body]};",
          "  --eden-font-mono: #{fonts[:mono]};"
        ].join("\n")
        parts << tag.style(":root {\n#{css}\n}".html_safe)
      end

      safe_join(parts, "\n")
    end
  end
end
