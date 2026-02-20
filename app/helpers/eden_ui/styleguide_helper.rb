module EdenUi
  module StyleguideHelper
    def styleguide_example(title:, source:, description: nil, &block)
      render partial: "eden_ui/styleguide/preview_card", locals: {
        title: title,
        source: source,
        description: description,
        content: block ? capture(&block) : nil
      }
    end

    def styleguide_block_example(title:, source:, description: nil, &block)
      render partial: "eden_ui/styleguide/block_preview_card", locals: {
        title: title,
        source: source,
        description: description,
        content: block ? capture(&block) : nil
      }
    end

    def styleguide_highlight_ruby(source)
      # Simple syntax highlighting using placeholder-based approach
      # to prevent regex passes from corrupting each other's HTML spans
      escaped = ERB::Util.html_escape(source)
      placeholders = {}
      counter = 0

      wrap = lambda do |match, css_class|
        key = "\x00HL#{counter += 1}\x00"
        placeholders[key] = %(<span class="#{css_class}">#{match}</span>)
        key
      end

      # Method names (eden_*) — first so they're protected from later passes
      escaped = escaped.gsub(/\b(eden_\w+)/) { wrap.call($1, "text-primary-400") }

      # Keywords
      escaped = escaped.gsub(/\b(do|end|def|class|module|if|else|elsif|unless|case|when|while|until|for|begin|rescue|ensure|raise|return|yield|block_given\?|nil|true|false|self)\b/) { wrap.call($1, "text-purple-400") }

      # Symbols
      escaped = escaped.gsub(/(:\w+)/) { wrap.call($1, "text-amber-400") }

      # Strings (double-quoted)
      escaped = escaped.gsub(/(&quot;[^&]*?&quot;)/) { wrap.call($1, "text-emerald-400") }

      # Strings (single-quoted)
      escaped = escaped.gsub(/(&#39;[^&]*?&#39;)/) { wrap.call($1, "text-emerald-400") }

      # Numbers
      escaped = escaped.gsub(/\b(\d+)\b/) { wrap.call($1, "text-orange-300") }

      # Comments
      escaped = escaped.gsub(/(#[^\n\x00]*)/) { wrap.call($1, "text-zinc-500") }

      # Expand all placeholders
      placeholders.each { |key, html| escaped = escaped.sub(key, html) }

      escaped.html_safe
    end

    def styleguide_icon_names
      EdenUi::IconHelper::ICONS.keys.sort
    end

    def styleguide_tokens_css
      path = EdenUi::Engine.root.join("app/assets/stylesheets/eden_ui/tokens.css")
      File.read(path)
    end

    def styleguide_animations_css
      path = EdenUi::Engine.root.join("app/assets/stylesheets/eden_ui/animations.css")
      File.read(path)
    end
  end
end
