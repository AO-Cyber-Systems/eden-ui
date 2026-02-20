module EdenUi
  module LegacyHelper
    def eden_design_font_tags
      eden_font_tags
    end

    def eden_design_theme_script
      tag.script <<~JS.html_safe
        if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
          document.documentElement.classList.add('dark');
        } else {
          document.documentElement.classList.remove('dark');
        }
      JS
    end
  end
end
