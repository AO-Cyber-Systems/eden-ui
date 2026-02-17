module EdenUi
  module Styleguide
    module BlockRegistry
      Block = Data.define(:name, :slug, :description)

      CATEGORIES = {
        marketing: {
          label: "Marketing",
          icon: "star",
          description: "Landing pages, hero sections, pricing, testimonials, and more",
          blocks: [
            Block.new(name: "Hero Sections", slug: "hero_sections", description: "Eye-catching hero areas with headlines, CTAs, and background imagery"),
            Block.new(name: "Feature Sections", slug: "feature_sections", description: "Showcase product features with icons, descriptions, and grids"),
            Block.new(name: "CTA Sections", slug: "cta_sections", description: "Call-to-action sections to drive user engagement"),
            Block.new(name: "Pricing Sections", slug: "pricing_sections", description: "Pricing tables and plan comparison cards"),
            Block.new(name: "Testimonial Sections", slug: "testimonial_sections", description: "Customer testimonials and social proof quotes"),
            Block.new(name: "FAQ Sections", slug: "faq_sections", description: "Frequently asked questions with expandable answers"),
            Block.new(name: "Team Sections", slug: "team_sections", description: "Team member cards with photos and roles"),
            Block.new(name: "Blog Sections", slug: "blog_sections", description: "Blog post listings with cards and featured articles"),
            Block.new(name: "Contact Form Sections", slug: "contact_form_sections", description: "Contact forms with fields and submission areas"),
            Block.new(name: "Newsletter Sections", slug: "newsletter_sections", description: "Email newsletter signup forms and banners"),
            Block.new(name: "Content Sections", slug: "content_sections", description: "Rich content areas with text, images, and media"),
            Block.new(name: "Header Sections", slug: "header_sections", description: "Page headers with navigation and branding"),
            Block.new(name: "Footer Sections", slug: "footer_sections", description: "Page footers with links, branding, and social icons"),
            Block.new(name: "Social Proof Sections", slug: "social_proof_sections", description: "Social proof with stats, logos, and trust signals"),
            Block.new(name: "Customer Logo Sections", slug: "customer_logo_sections", description: "Client and partner logo showcases"),
            Block.new(name: "Portfolio Sections", slug: "portfolio_sections", description: "Work portfolio galleries and project showcases"),
            Block.new(name: "Event Schedule Sections", slug: "event_schedule_sections", description: "Event timetables and schedule listings"),
            Block.new(name: "Banner", slug: "banner", description: "Promotional banners and announcements"),
            Block.new(name: "Cookie Consent Banners", slug: "cookie_consent_banners", description: "GDPR-compliant cookie consent notifications"),
            Block.new(name: "Popup Components", slug: "popup_components", description: "Modal popups for promotions and announcements"),
            Block.new(name: "Login Pages", slug: "login_pages", description: "User login and sign-in page layouts"),
            Block.new(name: "Register Pages", slug: "register_pages", description: "User registration and sign-up page layouts"),
            Block.new(name: "Reset Password Pages", slug: "reset_password_pages", description: "Password reset and recovery page layouts"),
            Block.new(name: "Account Recovery Sections", slug: "account_recovery_sections", description: "Account recovery flows and verification pages"),
            Block.new(name: "User Onboarding Pages", slug: "user_onboarding_pages", description: "User onboarding and welcome page flows"),
            Block.new(name: "404 Not Found Pages", slug: "404_not_found_pages", description: "Custom 404 error page designs"),
            Block.new(name: "500 Server Error Pages", slug: "500_server_error_pages", description: "Custom 500 server error page designs"),
            Block.new(name: "Maintenance Pages", slug: "maintenance_pages", description: "Site maintenance and downtime page designs")
          ]
        },
        application: {
          label: "Application",
          icon: "cog",
          description: "CRUD interfaces, dashboards, tables, and admin UI patterns",
          blocks: [
            Block.new(name: "CRUD Layouts", slug: "crud_layouts", description: "Complete CRUD interface layouts with tables and actions"),
            Block.new(name: "Advanced Tables", slug: "advanced_table_components", description: "Feature-rich data tables with sorting, filtering, and pagination"),
            Block.new(name: "Application Shell Layouts", slug: "application_shell_layouts", description: "App shell with sidebar, navbar, and content area"),
            Block.new(name: "Dashboard Navbar", slug: "dashboard_navbar_components", description: "Dashboard-specific navigation bars with search and user menus"),
            Block.new(name: "Dashboard Footer", slug: "dashboard_footer_components", description: "Dashboard footer sections with links and info"),
            Block.new(name: "Sidenav Components", slug: "sidenav_components", description: "Sidebar navigation panels with groups and icons"),
            Block.new(name: "Table Header", slug: "table_header_components", description: "Table header bars with search, filters, and bulk actions"),
            Block.new(name: "Table Footer", slug: "table_footer_components", description: "Table footers with pagination and result info"),
            Block.new(name: "Create Form", slug: "create_form_components", description: "Form layouts for creating new resources"),
            Block.new(name: "Create Modal", slug: "create_modal_components", description: "Modal dialogs for creating new resources"),
            Block.new(name: "Create Drawer", slug: "create_drawer_components", description: "Slide-out drawers for creating new resources"),
            Block.new(name: "Read Sections", slug: "read_sections", description: "Detail view sections for displaying resource data"),
            Block.new(name: "Read Modal", slug: "read_modal_components", description: "Modal dialogs for viewing resource details"),
            Block.new(name: "Read Drawer", slug: "read_drawer_components", description: "Slide-out drawers for viewing resource details"),
            Block.new(name: "Update Form", slug: "update_form_components", description: "Form layouts for editing existing resources"),
            Block.new(name: "Update Modal", slug: "update_modal_components", description: "Modal dialogs for editing existing resources"),
            Block.new(name: "Update Drawer", slug: "update_drawer_components", description: "Slide-out drawers for editing existing resources"),
            Block.new(name: "Delete Confirm", slug: "delete_confirm_components", description: "Confirmation dialogs for delete actions"),
            Block.new(name: "Dropdown Filters", slug: "dropdown_filter_components", description: "Dropdown-based filter menus for data views"),
            Block.new(name: "Faceted Search Drawer", slug: "faceted_search_drawer_components", description: "Advanced faceted search in slide-out drawers"),
            Block.new(name: "Faceted Search Modal", slug: "faceted_search_modal_components", description: "Advanced faceted search in modal dialogs"),
            Block.new(name: "Success Messages", slug: "success_message_components", description: "Success confirmation messages and notifications")
          ]
        },
        ecommerce: {
          label: "E-Commerce",
          icon: "shopping-cart",
          description: "Product pages, shopping carts, checkout flows, and order management",
          blocks: [
            Block.new(name: "Storefront Hero Sections", slug: "storefront_hero_sections", description: "E-commerce storefront hero banners and promotions"),
            Block.new(name: "Product Cards", slug: "product_card_components", description: "Product listing cards with images, prices, and actions"),
            Block.new(name: "Product Overview", slug: "product_overview_components", description: "Detailed product overview pages with galleries"),
            Block.new(name: "Product Information", slug: "product_information_components", description: "Product detail sections with specs and descriptions"),
            Block.new(name: "Product Categories", slug: "product_categories_components", description: "Category browsing grids and navigation"),
            Block.new(name: "Product Reviews", slug: "product_review_components", description: "Product review sections with ratings and comments"),
            Block.new(name: "Shopping Cart", slug: "shopping_cart_components", description: "Shopping cart pages with item management"),
            Block.new(name: "Checkout Pages", slug: "checkout_pages", description: "Multi-step checkout flow pages"),
            Block.new(name: "Payment Forms", slug: "payment_forms", description: "Payment method selection and card entry forms"),
            Block.new(name: "Order Confirmation", slug: "order_confirmation_pages", description: "Order confirmation and thank-you pages"),
            Block.new(name: "Order Summary", slug: "order_summary_pages", description: "Order summary pages with line items and totals"),
            Block.new(name: "Order Tracking", slug: "order_tracking_pages", description: "Order tracking pages with shipping status"),
            Block.new(name: "Orders Overview", slug: "orders_overview_pages", description: "Order history and management pages"),
            Block.new(name: "Account Overview", slug: "account_overview_pages", description: "User account dashboard pages"),
            Block.new(name: "Promotional Sections", slug: "promotional_sections", description: "Sale banners, promotions, and special offers"),
            Block.new(name: "Discount Popups", slug: "discount_popup_components", description: "Promotional discount popup dialogs"),
            Block.new(name: "E-Commerce Navbar", slug: "ecommerce_navbar_components", description: "Store navigation bars with cart and search"),
            Block.new(name: "Mega Footer", slug: "mega_footer_components", description: "Full-featured store footers with multiple sections"),
            Block.new(name: "Refund Forms", slug: "refund_forms", description: "Return and refund request forms"),
            Block.new(name: "Refund Status", slug: "refund_status_pages", description: "Refund status tracking pages"),
            Block.new(name: "Refund Overview", slug: "refund_overview_pages", description: "Refund history and overview pages"),
            Block.new(name: "Reviews History", slug: "reviews_history_pages", description: "User review history and management pages"),
            Block.new(name: "Customer Service", slug: "customer_service_pages", description: "Customer support and help center pages"),
            Block.new(name: "Service & Repair", slug: "service_repair_pages", description: "Service and repair request pages"),
            Block.new(name: "Warranty Pages", slug: "warranty_pages", description: "Product warranty information and claim pages")
          ]
        },
        publisher: {
          label: "Publisher",
          icon: "document",
          description: "Blog templates, comment sections, and article layouts",
          blocks: [
            Block.new(name: "Blog Templates", slug: "blog_template_pages", description: "Full blog article page templates with typography"),
            Block.new(name: "Comment Sections", slug: "comment_sections", description: "Comment threads with replies and interactions"),
            Block.new(name: "Related Articles", slug: "related_articles_sections", description: "Related article suggestions and recommendations")
          ]
        }
      }.freeze

      def self.categories
        CATEGORIES
      end

      def self.find_category(slug)
        CATEGORIES[slug.to_sym]
      end

      def self.find_block(category_slug, block_slug)
        category = find_category(category_slug)
        return nil unless category

        category[:blocks].find { |b| b.slug == block_slug.to_s }
      end

      def self.all_blocks
        CATEGORIES.flat_map { |_key, cat| cat[:blocks] }
      end

      def self.block_count
        all_blocks.size
      end
    end
  end
end
