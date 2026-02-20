module EdenUi
  module BrandPresets
    SHADES = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950].freeze

    PRESETS = {
      gold: {
        50 => "#fdf8ef", 100 => "#faecd5", 200 => "#f4d5aa", 300 => "#edb974",
        400 => "#e59a3c", 500 => "#d4a853", 600 => "#c49545", 700 => "#a67a38",
        800 => "#856131", 900 => "#6c5029", 950 => "#3d2a14",
        rgb_500: "212, 168, 83"
      },
      blue: {
        50 => "#eff6ff", 100 => "#dbeafe", 200 => "#bfdbfe", 300 => "#93c5fd",
        400 => "#60a5fa", 500 => "#3b82f6", 600 => "#2563eb", 700 => "#1d4ed8",
        800 => "#1e40af", 900 => "#1e3a8a", 950 => "#172554",
        rgb_500: "59, 130, 246"
      },
      emerald: {
        50 => "#ecfdf5", 100 => "#d1fae5", 200 => "#a7f3d0", 300 => "#6ee7b7",
        400 => "#34d399", 500 => "#10b981", 600 => "#059669", 700 => "#047857",
        800 => "#065f46", 900 => "#064e3b", 950 => "#022c22",
        rgb_500: "16, 185, 129"
      },
      purple: {
        50 => "#faf5ff", 100 => "#f3e8ff", 200 => "#e9d5ff", 300 => "#d8b4fe",
        400 => "#c084fc", 500 => "#a855f7", 600 => "#9333ea", 700 => "#7e22ce",
        800 => "#6b21a8", 900 => "#581c87", 950 => "#3b0764",
        rgb_500: "168, 85, 247"
      },
      red: {
        50 => "#fef2f2", 100 => "#fee2e2", 200 => "#fecaca", 300 => "#fca5a5",
        400 => "#f87171", 500 => "#ef4444", 600 => "#dc2626", 700 => "#b91c1c",
        800 => "#991b1b", 900 => "#7f1d1d", 950 => "#450a0a",
        rgb_500: "239, 68, 68"
      },
      slate: {
        50 => "#f8fafc", 100 => "#f1f5f9", 200 => "#e2e8f0", 300 => "#cbd5e1",
        400 => "#94a3b8", 500 => "#64748b", 600 => "#475569", 700 => "#334155",
        800 => "#1e293b", 900 => "#0f172a", 950 => "#020617",
        rgb_500: "100, 116, 139"
      }
    }.freeze

    FONT_PRESETS = {
      default: {
        display: "'Outfit', system-ui, -apple-system, sans-serif",
        body: "'Plus Jakarta Sans', system-ui, -apple-system, sans-serif",
        mono: "'JetBrains Mono', 'Fira Code', monospace",
        google_fonts_url: "https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&family=Outfit:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap"
      },
      inter: {
        display: "'Inter', system-ui, -apple-system, sans-serif",
        body: "'Inter', system-ui, -apple-system, sans-serif",
        mono: "'JetBrains Mono', 'Fira Code', monospace",
        google_fonts_url: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap"
      },
      system: {
        display: "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
        body: "system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
        mono: "ui-monospace, SFMono-Regular, 'SF Mono', Menlo, monospace",
        google_fonts_url: nil
      }
    }.freeze

    class << self
      def resolve_colors(brand_color)
        case brand_color
        when Symbol, String
          key = brand_color.to_sym
          PRESETS.fetch(key) { raise ArgumentError, "Unknown brand preset: #{key.inspect}. Available: #{PRESETS.keys.join(', ')}" }
        when Hash
          validate_custom_palette!(brand_color)
          brand_color
        else
          PRESETS[:gold]
        end
      end

      def resolve_fonts(font_preset)
        case font_preset
        when Symbol, String
          key = font_preset.to_sym
          FONT_PRESETS.fetch(key) { raise ArgumentError, "Unknown font preset: #{key.inspect}. Available: #{FONT_PRESETS.keys.join(', ')}" }
        when Hash
          font_preset
        else
          FONT_PRESETS[:default]
        end
      end

      private

      def validate_custom_palette!(palette)
        missing = SHADES.reject { |s| palette.key?(s) }
        missing << :rgb_500 unless palette.key?(:rgb_500)
        return if missing.empty?

        raise ArgumentError, "Custom brand palette is missing keys: #{missing.join(', ')}. " \
          "Required: #{(SHADES + [:rgb_500]).join(', ')}"
      end
    end
  end
end
