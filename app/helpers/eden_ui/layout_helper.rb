module EdenUi
  module LayoutHelper
    def eden_app_layout(app_name: EdenUi.configuration.app_name, logo_path: EdenUi.configuration.logo_path, sidebar_items: [], sidebar_bottom_items: [], sidebar_header: nil, user: nil, footer_links: [], **html_options, &block)
      render partial: "eden_ui/layouts/app", locals: {
        app_name:, logo_path:, sidebar_items:, sidebar_bottom_items:, sidebar_header:, user:, footer_links:,
        content: block ? capture(&block) : nil
      }
    end

    def eden_chat_layout(app_name: EdenUi.configuration.app_name, conversations: [], current_conversation: nil, user: nil, **html_options, &block)
      render partial: "eden_ui/layouts/chat", locals: {
        app_name:, conversations:, current_conversation:, user:,
        content: block ? capture(&block) : nil
      }
    end

    def eden_marketing_layout(app_name: EdenUi.configuration.app_name, logo_path: EdenUi.configuration.logo_path, nav_items: [], cta_text: nil, cta_path: nil, login_text: nil, login_path: nil, **html_options, &block)
      render partial: "eden_ui/layouts/marketing", locals: {
        app_name:, logo_path:, nav_items:, cta_text:, cta_path:, login_text:, login_path:,
        content: block ? capture(&block) : nil
      }
    end

    def eden_auth_layout(app_name: EdenUi.configuration.app_name, logo_path: EdenUi.configuration.logo_path, variant: :centered, heading: nil, description: nil, **html_options, &block)
      render partial: "eden_ui/layouts/auth", locals: {
        app_name:, logo_path:, variant:, heading:, description:,
        content: block ? capture(&block) : nil
      }
    end
  end
end
