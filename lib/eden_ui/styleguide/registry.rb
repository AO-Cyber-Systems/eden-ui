module EdenUi
  module Styleguide
    module Registry
      Param = Data.define(:name, :type, :default, :description, :options)
      Component = Data.define(:name, :slug, :helper_method, :description, :params, :has_block)

      CATEGORIES = {
        buttons: {
          label: "Buttons & Actions",
          icon: "plus",
          description: "Interactive elements for user actions",
          components: [
            Component.new(
              name: "Button",
              slug: "button",
              helper_method: "eden_button",
              description: "Primary action button with multiple variants, sizes, and styles.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":primary", description: "Visual style", options: %w[primary secondary danger success warning dark ghost]),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Button size", options: %w[xs sm md lg xl]),
                Param.new(name: :outline, type: :boolean, default: "false", description: "Outline style instead of filled", options: nil),
                Param.new(name: :pill, type: :boolean, default: "false", description: "Fully rounded pill shape", options: nil),
                Param.new(name: :type, type: :symbol, default: ":button", description: "HTML button type", options: %w[button submit reset]),
                Param.new(name: :href, type: :string, default: "nil", description: "Renders as an anchor tag when set", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Button Group",
              slug: "button_group",
              helper_method: "eden_button_group",
              description: "Groups multiple buttons together with shared borders.",
              has_block: true,
              params: []
            ),
            Component.new(
              name: "Speed Dial",
              slug: "speed_dial",
              helper_method: "eden_speed_dial",
              description: "Floating action button with expandable action menu.",
              has_block: true,
              params: [
                Param.new(name: :position, type: :symbol, default: ":bottom_right", description: "Screen position", options: %w[bottom_right bottom_left top_right top_left]),
                Param.new(name: :trigger, type: :symbol, default: ":hover", description: "How to open the menu", options: %w[hover click])
              ]
            )
          ]
        },
        navigation: {
          label: "Navigation",
          icon: "bars-3",
          description: "Components for navigating between pages and sections",
          components: [
            Component.new(
              name: "Navbar",
              slug: "navbar",
              helper_method: "eden_navbar",
              description: "Top navigation bar with fixed and transparent variants.",
              has_block: true,
              params: [
                Param.new(name: :fixed, type: :boolean, default: "true", description: "Fixed to top of viewport", options: nil),
                Param.new(name: :transparent, type: :boolean, default: "false", description: "Transparent background", options: nil)
              ]
            ),
            Component.new(
              name: "Breadcrumb",
              slug: "breadcrumb",
              helper_method: "eden_breadcrumb",
              description: "Breadcrumb navigation showing the current page hierarchy.",
              has_block: true,
              params: []
            ),
            Component.new(
              name: "Pagination",
              slug: "pagination",
              helper_method: "eden_pagination",
              description: "Page navigation for paginated content.",
              has_block: false,
              params: [
                Param.new(name: :current_page, type: :integer, default: "nil", description: "Currently active page number", options: nil),
                Param.new(name: :total_pages, type: :integer, default: "nil", description: "Total number of pages", options: nil),
                Param.new(name: :path_proc, type: :proc, default: "nil", description: "Lambda returning URL for a page number", options: nil)
              ]
            ),
            Component.new(
              name: "Tabs",
              slug: "tabs",
              helper_method: "eden_tabs",
              description: "Tabbed navigation with multiple visual variants.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual style", options: %w[default underline pills fullwidth])
              ]
            ),
            Component.new(
              name: "Bottom Nav",
              slug: "bottom_nav",
              helper_method: "eden_bottom_nav",
              description: "Mobile-style bottom navigation bar.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual style", options: %w[default app])
              ]
            ),
            Component.new(
              name: "Sidebar",
              slug: "sidebar",
              helper_method: "eden_sidebar",
              description: "Collapsible sidebar navigation with groups and items.",
              has_block: true,
              params: [
                Param.new(name: :collapsed, type: :boolean, default: "false", description: "Start in collapsed state", options: nil),
                Param.new(name: :position, type: :symbol, default: ":left", description: "Side of the screen", options: %w[left right])
              ]
            ),
            Component.new(
              name: "Mega Menu",
              slug: "mega_menu",
              helper_method: "eden_mega_menu",
              description: "Large dropdown menu for complex navigation.",
              has_block: true,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Menu trigger label", options: nil)
              ]
            )
          ]
        },
        data_display: {
          label: "Data Display",
          icon: "document",
          description: "Components for presenting data and information",
          components: [
            Component.new(
              name: "Badge",
              slug: "badge",
              helper_method: "eden_badge",
              description: "Small status indicator with text and optional icon.",
              has_block: true,
              params: [
                Param.new(name: :text, type: :string, default: "nil", description: "Badge text content", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Color variant", options: %w[default primary success warning danger info dark]),
                Param.new(name: :size, type: :symbol, default: ":sm", description: "Badge size", options: %w[xs sm]),
                Param.new(name: :pill, type: :boolean, default: "false", description: "Fully rounded", options: nil),
                Param.new(name: :bordered, type: :boolean, default: "false", description: "Add border", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name to prepend", options: nil),
                Param.new(name: :dismissible, type: :boolean, default: "false", description: "Show close button", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Makes badge a link", options: nil)
              ]
            ),
            Component.new(
              name: "Alert",
              slug: "alert",
              helper_method: "eden_alert",
              description: "Contextual feedback messages for user actions.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":info", description: "Color variant", options: %w[info success warning danger dark]),
                Param.new(name: :dismissible, type: :boolean, default: "false", description: "Show close button", options: nil),
                Param.new(name: :bordered, type: :boolean, default: "false", description: "Add left border accent", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name to display", options: nil)
              ]
            ),
            Component.new(
              name: "Table",
              slug: "table",
              helper_method: "eden_table",
              description: "Data table with striped and hoverable options.",
              has_block: true,
              params: [
                Param.new(name: :striped, type: :boolean, default: "false", description: "Alternate row backgrounds", options: nil),
                Param.new(name: :hoverable, type: :boolean, default: "false", description: "Highlight rows on hover", options: nil)
              ]
            ),
            Component.new(
              name: "List Group",
              slug: "list_group",
              helper_method: "eden_list_group",
              description: "Vertical list of items with optional links and icons.",
              has_block: true,
              params: [
                Param.new(name: :bordered, type: :boolean, default: "true", description: "Show borders between items", options: nil)
              ]
            ),
            Component.new(
              name: "Timeline",
              slug: "timeline",
              helper_method: "eden_timeline",
              description: "Chronological list of events or activities.",
              has_block: true,
              params: [
                Param.new(name: :horizontal, type: :boolean, default: "false", description: "Horizontal layout", options: nil)
              ]
            ),
            Component.new(
              name: "Stats Card",
              slug: "stat_card",
              helper_method: "eden_stat_card",
              description: "Dashboard statistics card with value, label, trend, and optional icon.",
              has_block: true,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Stat label text", options: nil),
                Param.new(name: :value, type: :string, default: "nil", description: "Primary value to display", options: nil),
                Param.new(name: :change, type: :string, default: "nil", description: "Change description text", options: nil),
                Param.new(name: :trend, type: :symbol, default: "nil", description: "Trend direction", options: %w[up down]),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name for the card", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Border color variant", options: %w[default primary success warning danger])
              ]
            ),
            Component.new(
              name: "Code Block",
              slug: "code_block",
              helper_method: "eden_code_block",
              description: "Syntax-highlighted code display with optional copy button and line numbers.",
              has_block: false,
              params: [
                Param.new(name: :code, type: :string, default: "nil", description: "Code content to display (required)", options: nil),
                Param.new(name: :language, type: :string, default: "nil", description: "Programming language label", options: nil),
                Param.new(name: :line_numbers, type: :boolean, default: "false", description: "Show line numbers", options: nil),
                Param.new(name: :copyable, type: :boolean, default: "true", description: "Show copy button", options: nil)
              ]
            ),
            Component.new(
              name: "Description List",
              slug: "description_list",
              helper_method: "eden_description_list",
              description: "Key-value list for displaying structured data with horizontal or vertical layout.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":horizontal", description: "Layout direction", options: %w[horizontal vertical]),
                Param.new(name: :columns, type: :integer, default: "1", description: "Number of grid columns", options: nil),
                Param.new(name: :bordered, type: :boolean, default: "false", description: "Show dividers between items", options: nil),
                Param.new(name: :striped, type: :boolean, default: "false", description: "Alternate row backgrounds", options: nil)
              ]
            )
          ]
        },
        media: {
          label: "Media & Identity",
          icon: "user",
          description: "Components for displaying users, media, and identity",
          components: [
            Component.new(
              name: "Avatar",
              slug: "avatar",
              helper_method: "eden_avatar",
              description: "User profile image with size, shape, and status options.",
              has_block: false,
              params: [
                Param.new(name: :src, type: :string, default: "nil", description: "Image URL", options: nil),
                Param.new(name: :alt, type: :string, default: '"Avatar"', description: "Alt text for image", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Avatar size", options: %w[xs sm md lg xl]),
                Param.new(name: :rounded, type: :boolean, default: "true", description: "Circular shape", options: nil),
                Param.new(name: :bordered, type: :boolean, default: "false", description: "Show border ring", options: nil),
                Param.new(name: :status, type: :symbol, default: "nil", description: "Online status indicator", options: %w[online offline away busy]),
                Param.new(name: :initials, type: :string, default: "nil", description: "Fallback text initials", options: nil)
              ]
            ),
            Component.new(
              name: "Indicator",
              slug: "indicator",
              helper_method: "eden_indicator",
              description: "Small dot or badge indicator overlaid on content.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Color variant", options: %w[default primary success warning danger info dark]),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Indicator size", options: %w[sm md lg xl]),
                Param.new(name: :position, type: :symbol, default: ":top_right", description: "Position relative to parent", options: %w[top_right top_left bottom_right bottom_left]),
                Param.new(name: :ping, type: :boolean, default: "false", description: "Animated ping effect", options: nil)
              ]
            ),
            Component.new(
              name: "Kbd",
              slug: "kbd",
              helper_method: "eden_kbd",
              description: "Keyboard key indicator for shortcuts.",
              has_block: true,
              params: [
                Param.new(name: :text, type: :string, default: "nil", description: "Key text to display", options: nil)
              ]
            )
          ]
        },
        containers: {
          label: "Containers",
          icon: "document",
          description: "Structural components for grouping and organizing content",
          components: [
            Component.new(
              name: "Card",
              slug: "card",
              helper_method: "eden_card",
              description: "Flexible content container with optional image and link.",
              has_block: true,
              params: [
                Param.new(name: :href, type: :string, default: "nil", description: "Makes entire card clickable", options: nil),
                Param.new(name: :horizontal, type: :boolean, default: "false", description: "Horizontal layout with side image", options: nil),
                Param.new(name: :image, type: :string, default: "nil", description: "Card image URL", options: nil),
                Param.new(name: :image_alt, type: :string, default: "nil", description: "Image alt text", options: nil)
              ]
            ),
            Component.new(
              name: "Accordion",
              slug: "accordion",
              helper_method: "eden_accordion",
              description: "Collapsible content panels for showing and hiding sections.",
              has_block: true,
              params: [
                Param.new(name: :flush, type: :boolean, default: "false", description: "Remove outer borders", options: nil),
                Param.new(name: :always_open, type: :boolean, default: "false", description: "Allow multiple open panels", options: nil)
              ]
            ),
            Component.new(
              name: "Drawer",
              slug: "drawer",
              helper_method: "eden_drawer",
              description: "Slide-out panel from any edge of the screen.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Unique identifier (required)", options: nil),
                Param.new(name: :position, type: :symbol, default: ":left", description: "Slide direction", options: %w[left right top bottom]),
                Param.new(name: :backdrop, type: :boolean, default: "true", description: "Show overlay backdrop", options: nil)
              ]
            ),
            Component.new(
              name: "Banner",
              slug: "banner",
              helper_method: "eden_banner",
              description: "Site-wide announcement or notification banner.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual style", options: %w[default info success warning danger]),
                Param.new(name: :position, type: :symbol, default: ":top", description: "Screen position", options: %w[top bottom]),
                Param.new(name: :dismissible, type: :boolean, default: "true", description: "Can be dismissed", options: nil)
              ]
            ),
            Component.new(
              name: "Jumbotron",
              slug: "jumbotron",
              helper_method: "eden_jumbotron",
              description: "Large showcase area for featured content or hero sections.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Heading text", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Subtitle or description", options: nil)
              ]
            )
          ]
        },
        forms: {
          label: "Forms",
          icon: "pencil",
          description: "Form inputs and controls for user data entry",
          components: [
            Component.new(
              name: "Input",
              slug: "input",
              helper_method: "eden_input",
              description: "Text input field with multiple types and sizes.",
              has_block: false,
              params: [
                Param.new(name: :type, type: :symbol, default: ":text", description: "HTML input type", options: %w[text email password number url tel]),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Input size", options: %w[sm md lg]),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil),
                Param.new(name: :placeholder, type: :string, default: "nil", description: "Placeholder text", options: nil),
                Param.new(name: :value, type: :string, default: "nil", description: "Input value", options: nil),
                Param.new(name: :id, type: :string, default: "nil", description: "HTML id attribute", options: nil),
                Param.new(name: :name, type: :string, default: "nil", description: "HTML name attribute", options: nil)
              ]
            ),
            Component.new(
              name: "Textarea",
              slug: "textarea",
              helper_method: "eden_textarea",
              description: "Multi-line text input field.",
              has_block: false,
              params: [
                Param.new(name: :rows, type: :integer, default: "4", description: "Number of visible rows", options: nil),
                Param.new(name: :placeholder, type: :string, default: "nil", description: "Placeholder text", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Select",
              slug: "select",
              helper_method: "eden_select",
              description: "Dropdown select input with single or multiple selection.",
              has_block: false,
              params: [
                Param.new(name: :options, type: :array, default: "[]", description: "Array of [label, value] pairs", options: nil),
                Param.new(name: :selected, type: :string, default: "nil", description: "Pre-selected value", options: nil),
                Param.new(name: :placeholder, type: :string, default: "nil", description: "Placeholder option text", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil),
                Param.new(name: :multiple, type: :boolean, default: "false", description: "Allow multiple selections", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Input size", options: %w[sm md lg])
              ]
            ),
            Component.new(
              name: "Checkbox",
              slug: "checkbox",
              helper_method: "eden_checkbox",
              description: "Checkbox input with optional label.",
              has_block: false,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Label text", options: nil),
                Param.new(name: :checked, type: :boolean, default: "false", description: "Checked state", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Radio",
              slug: "radio",
              helper_method: "eden_radio",
              description: "Radio button input with label.",
              has_block: false,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Label text", options: nil),
                Param.new(name: :checked, type: :boolean, default: "false", description: "Checked state", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Toggle",
              slug: "toggle",
              helper_method: "eden_toggle",
              description: "Toggle switch for on/off states.",
              has_block: false,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Label text", options: nil),
                Param.new(name: :checked, type: :boolean, default: "false", description: "Checked state", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Toggle size", options: %w[sm md lg])
              ]
            ),
            Component.new(
              name: "File Input",
              slug: "file_input",
              helper_method: "eden_file_input",
              description: "File upload input with helper text.",
              has_block: false,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Label text", options: nil),
                Param.new(name: :hint, type: :string, default: "nil", description: "Helper text below input", options: nil),
                Param.new(name: :multiple, type: :boolean, default: "false", description: "Allow multiple files", options: nil),
                Param.new(name: :accept, type: :string, default: "nil", description: "Accepted file types", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Dropzone",
              slug: "dropzone",
              helper_method: "eden_dropzone",
              description: "Drag-and-drop file upload area.",
              has_block: true,
              params: []
            ),
            Component.new(
              name: "Range",
              slug: "range",
              helper_method: "eden_range",
              description: "Range slider input.",
              has_block: false,
              params: [
                Param.new(name: :min, type: :integer, default: "0", description: "Minimum value", options: nil),
                Param.new(name: :max, type: :integer, default: "100", description: "Maximum value", options: nil),
                Param.new(name: :step, type: :integer, default: "1", description: "Step increment", options: nil),
                Param.new(name: :value, type: :integer, default: "50", description: "Current value", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Slider size", options: %w[sm md lg])
              ]
            ),
            Component.new(
              name: "Floating Label",
              slug: "floating_label",
              helper_method: "eden_floating_label",
              description: "Input with animated floating label.",
              has_block: false,
              params: [
                Param.new(name: :type, type: :symbol, default: ":text", description: "HTML input type", options: %w[text email password]),
                Param.new(name: :label, type: :string, default: "nil", description: "Label text (required)", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual variant", options: %w[default filled outlined]),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Input size", options: %w[sm md])
              ]
            ),
            Component.new(
              name: "Search Input",
              slug: "search_input",
              helper_method: "eden_search_input",
              description: "Search input with magnifying glass icon.",
              has_block: false,
              params: [
                Param.new(name: :placeholder, type: :string, default: '"Search..."', description: "Placeholder text", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Input size", options: %w[sm md lg])
              ]
            ),
            Component.new(
              name: "Phone Input",
              slug: "phone_input",
              helper_method: "eden_phone_input",
              description: "Phone number input with country code prefix.",
              has_block: false,
              params: [
                Param.new(name: :placeholder, type: :string, default: "nil", description: "Placeholder text", options: nil),
                Param.new(name: :country_code, type: :string, default: '"+1"', description: "Country dialing code", options: nil)
              ]
            ),
            Component.new(
              name: "Timepicker",
              slug: "timepicker",
              helper_method: "eden_timepicker",
              description: "Time selection input.",
              has_block: false,
              params: [
                Param.new(name: :value, type: :string, default: "nil", description: "Initial time value", options: nil),
                Param.new(name: :min, type: :string, default: "nil", description: "Minimum time", options: nil),
                Param.new(name: :max, type: :string, default: "nil", description: "Maximum time", options: nil),
                Param.new(name: :step, type: :integer, default: "nil", description: "Step in seconds", options: nil)
              ]
            ),
            Component.new(
              name: "Form Group",
              slug: "form_group",
              helper_method: "eden_form_group",
              description: "Groups a label, input, hint, and error together.",
              has_block: true,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Label text", options: nil),
                Param.new(name: :hint, type: :string, default: "nil", description: "Helper text", options: nil),
                Param.new(name: :error, type: :string, default: "nil", description: "Error message", options: nil),
                Param.new(name: :required, type: :boolean, default: "false", description: "Show required indicator", options: nil)
              ]
            ),
            Component.new(
              name: "Helper Text",
              slug: "helper_text",
              helper_method: "eden_helper_text",
              description: "Small helper or hint text below form inputs.",
              has_block: true,
              params: [
                Param.new(name: :text, type: :string, default: "nil", description: "Helper text content", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Color variant", options: %w[default success error])
              ]
            ),
            Component.new(
              name: "Tag Input",
              slug: "tag_input",
              helper_method: "eden_tag_input",
              description: "Form input for adding and removing tags with keyboard support.",
              has_block: false,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "HTML name attribute", options: nil),
                Param.new(name: :id, type: :string, default: "nil", description: "HTML id attribute", options: nil),
                Param.new(name: :value, type: :array, default: "[]", description: "Initial tag values", options: nil),
                Param.new(name: :placeholder, type: :string, default: '"Add a tag..."', description: "Placeholder text", options: nil),
                Param.new(name: :max_tags, type: :integer, default: "nil", description: "Maximum number of tags (nil = unlimited)", options: nil),
                Param.new(name: :delimiter, type: :string, default: '","', description: "Delimiter for hidden input value", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Datepicker",
              slug: "datepicker",
              helper_method: "eden_datepicker",
              description: "Date selection input with calendar dropdown.",
              has_block: false,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "HTML name attribute", options: nil),
                Param.new(name: :id, type: :string, default: "nil", description: "HTML id attribute", options: nil),
                Param.new(name: :value, type: :string, default: "nil", description: "Initial date value (YYYY-MM-DD)", options: nil),
                Param.new(name: :min, type: :string, default: "nil", description: "Minimum selectable date", options: nil),
                Param.new(name: :max, type: :string, default: "nil", description: "Maximum selectable date", options: nil),
                Param.new(name: :placeholder, type: :string, default: '"Select date"', description: "Placeholder text", options: nil),
                Param.new(name: :format, type: :string, default: '"%Y-%m-%d"', description: "Date display format", options: nil),
                Param.new(name: :disabled, type: :boolean, default: "false", description: "Disabled state", options: nil)
              ]
            ),
            Component.new(
              name: "Rich Editor",
              slug: "rich_editor",
              helper_method: "eden_rich_editor",
              description: "Rich text editor with configurable toolbar and formatting buttons.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: '"editor"', description: "HTML id attribute for the textarea", options: nil),
                Param.new(name: :name, type: :string, default: '"content"', description: "HTML name attribute for form submission", options: nil),
                Param.new(name: :value, type: :string, default: "nil", description: "Initial content value", options: nil),
                Param.new(name: :placeholder, type: :string, default: '"Write something..."', description: "Placeholder text", options: nil),
                Param.new(name: :toolbar, type: :array, default: "[:bold, :italic, :underline, :link, :list_ul, :list_ol, :quote, :code, :image]", description: "Toolbar buttons to display", options: %w[bold italic underline link list_ul list_ol quote code image])
              ]
            )
          ]
        },
        auth_forms: {
          label: "Auth Forms",
          icon: "lock-closed",
          description: "Pre-built authentication form components",
          components: [
            Component.new(
              name: "Sign In Form",
              slug: "sign_in_form",
              helper_method: "eden_sign_in_form",
              description: "Complete sign-in form with email, password, remember me, and social login options.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":post", description: "HTTP method", options: %w[post get]),
                Param.new(name: :heading, type: :string, default: '"Sign in to your account"', description: "Form heading text", options: nil),
                Param.new(name: :form, type: :object, default: "nil", description: "Rails form builder for Devise integration", options: nil),
                Param.new(name: :remember_me, type: :boolean, default: "true", description: "Show remember me checkbox", options: nil),
                Param.new(name: :forgot_password_url, type: :string, default: "nil", description: "Forgot password link URL", options: nil),
                Param.new(name: :sign_up_url, type: :string, default: "nil", description: "Sign up link URL", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Sign in"', description: "Submit button text", options: nil),
                Param.new(name: :social_buttons, type: :string, default: "nil", description: "Rendered HTML for social login buttons", options: nil)
              ]
            ),
            Component.new(
              name: "Sign Up Form",
              slug: "sign_up_form",
              helper_method: "eden_sign_up_form",
              description: "Registration form with name, email, password, confirmation, and terms acceptance.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":post", description: "HTTP method", options: %w[post get]),
                Param.new(name: :heading, type: :string, default: '"Create an account"', description: "Form heading text", options: nil),
                Param.new(name: :form, type: :object, default: "nil", description: "Rails form builder for Devise integration", options: nil),
                Param.new(name: :name_field, type: :boolean, default: "true", description: "Show name field", options: nil),
                Param.new(name: :confirm_password, type: :boolean, default: "true", description: "Show password confirmation field", options: nil),
                Param.new(name: :password_hint, type: :string, default: "nil", description: "Hint text below password field", options: nil),
                Param.new(name: :terms_url, type: :string, default: "nil", description: "Terms and conditions link URL", options: nil),
                Param.new(name: :sign_in_url, type: :string, default: "nil", description: "Sign in link URL", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Create account"', description: "Submit button text", options: nil),
                Param.new(name: :social_buttons, type: :string, default: "nil", description: "Rendered HTML for social login buttons", options: nil)
              ]
            ),
            Component.new(
              name: "Forgot Password Form",
              slug: "forgot_password_form",
              helper_method: "eden_forgot_password_form",
              description: "Password reset request form with email input.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":post", description: "HTTP method", options: %w[post get]),
                Param.new(name: :heading, type: :string, default: '"Forgot your password?"', description: "Form heading text", options: nil),
                Param.new(name: :description, type: :string, default: '"No worries, we\'ll send you reset instructions."', description: "Description text below heading", options: nil),
                Param.new(name: :form, type: :object, default: "nil", description: "Rails form builder for Devise integration", options: nil),
                Param.new(name: :sign_in_url, type: :string, default: "nil", description: "Sign in link URL", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Send reset instructions"', description: "Submit button text", options: nil)
              ]
            ),
            Component.new(
              name: "Reset Password Form",
              slug: "reset_password_form",
              helper_method: "eden_reset_password_form",
              description: "Password reset form with new password and confirmation fields.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":put", description: "HTTP method", options: %w[put patch post]),
                Param.new(name: :heading, type: :string, default: '"Reset your password"', description: "Form heading text", options: nil),
                Param.new(name: :form, type: :object, default: "nil", description: "Rails form builder for Devise integration", options: nil),
                Param.new(name: :password_hint, type: :string, default: "nil", description: "Hint text below password field", options: nil),
                Param.new(name: :reset_token, type: :string, default: "nil", description: "Password reset token (standalone mode)", options: nil),
                Param.new(name: :sign_in_url, type: :string, default: "nil", description: "Sign in link URL", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Reset password"', description: "Submit button text", options: nil)
              ]
            ),
            Component.new(
              name: "Edit Profile Form",
              slug: "edit_profile_form",
              helper_method: "eden_edit_profile_form",
              description: "Profile editing form with name, email, password change, and account deletion.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":put", description: "HTTP method", options: %w[put patch post]),
                Param.new(name: :heading, type: :string, default: '"Edit profile"', description: "Form heading text", options: nil),
                Param.new(name: :form, type: :object, default: "nil", description: "Rails form builder for Devise integration", options: nil),
                Param.new(name: :name_field, type: :boolean, default: "true", description: "Show name field", options: nil),
                Param.new(name: :password_hint, type: :string, default: "nil", description: "Hint text below password field", options: nil),
                Param.new(name: :cancel_url, type: :string, default: "nil", description: "Back/cancel link URL", options: nil),
                Param.new(name: :delete_url, type: :string, default: "nil", description: "Account deletion URL (shows danger zone)", options: nil),
                Param.new(name: :delete_confirm, type: :string, default: '"Are you sure?"', description: "Delete confirmation message", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Update profile"', description: "Submit button text", options: nil)
              ]
            ),
            Component.new(
              name: "Two Factor Form",
              slug: "two_factor_form",
              helper_method: "eden_two_factor_form",
              description: "Two-factor authentication form with individual digit inputs and resend/back links.",
              has_block: true,
              params: [
                Param.new(name: :url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :method, type: :symbol, default: ":post", description: "HTTP method", options: %w[post get]),
                Param.new(name: :heading, type: :string, default: '"Two-factor authentication"', description: "Form heading text", options: nil),
                Param.new(name: :description, type: :string, default: '"Enter the code from your authenticator app."', description: "Description below heading", options: nil),
                Param.new(name: :code_length, type: :integer, default: "6", description: "Number of code digit inputs", options: nil),
                Param.new(name: :resend_url, type: :string, default: "nil", description: "Resend code link URL", options: nil),
                Param.new(name: :back_url, type: :string, default: "nil", description: "Back to login link URL", options: nil),
                Param.new(name: :submit_text, type: :string, default: '"Verify"', description: "Submit button text", options: nil)
              ]
            )
          ]
        },
        overlays: {
          label: "Overlays",
          icon: "chat-bubble-left",
          description: "Floating and overlay components",
          components: [
            Component.new(
              name: "Dropdown",
              slug: "dropdown",
              helper_method: "eden_dropdown",
              description: "Dropdown menu with items, dividers, and headers.",
              has_block: true,
              params: [
                Param.new(name: :label, type: :string, default: "nil", description: "Trigger button label", options: nil),
                Param.new(name: :trigger, type: :symbol, default: ":click", description: "Open trigger type", options: %w[click hover]),
                Param.new(name: :placement, type: :symbol, default: ":bottom", description: "Menu position", options: %w[top bottom left right])
              ]
            ),
            Component.new(
              name: "Modal",
              slug: "modal",
              helper_method: "eden_modal",
              description: "Dialog window overlay with backdrop.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Unique identifier (required)", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Modal width", options: %w[sm md lg xl]),
                Param.new(name: :dismissible, type: :boolean, default: "true", description: "Can be closed", options: nil),
                Param.new(name: :position, type: :symbol, default: ":center", description: "Vertical position", options: %w[center top])
              ]
            ),
            Component.new(
              name: "Tooltip",
              slug: "tooltip",
              helper_method: "eden_tooltip",
              description: "Small popup showing additional information on hover.",
              has_block: true,
              params: [
                Param.new(name: :text, type: :string, default: "nil", description: "Tooltip text content", options: nil),
                Param.new(name: :placement, type: :symbol, default: ":top", description: "Tooltip position", options: %w[top bottom left right]),
                Param.new(name: :trigger, type: :symbol, default: ":hover", description: "Open trigger type", options: %w[hover click])
              ]
            ),
            Component.new(
              name: "Popover",
              slug: "popover",
              helper_method: "eden_popover",
              description: "Rich content popup with title and body.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Popover title", options: nil),
                Param.new(name: :placement, type: :symbol, default: ":top", description: "Popover position", options: %w[top bottom left right]),
                Param.new(name: :trigger, type: :symbol, default: ":hover", description: "Open trigger type", options: %w[hover click])
              ]
            ),
            Component.new(
              name: "Toast",
              slug: "toast",
              helper_method: "eden_toast",
              description: "Brief notification messages that auto-dismiss.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Color variant", options: %w[default success warning danger]),
                Param.new(name: :dismissible, type: :boolean, default: "true", description: "Show close button", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name to display", options: nil)
              ]
            )
          ]
        },
        utility: {
          label: "Utility",
          icon: "cog",
          description: "Utility components for loading states, progress, and more",
          components: [
            Component.new(
              name: "Spinner",
              slug: "spinner",
              helper_method: "eden_spinner",
              description: "Loading spinner indicator.",
              has_block: false,
              params: [
                Param.new(name: :size, type: :symbol, default: ":md", description: "Spinner size", options: %w[xs sm md lg xl]),
                Param.new(name: :variant, type: :symbol, default: ":primary", description: "Color variant", options: %w[primary secondary success warning danger info])
              ]
            ),
            Component.new(
              name: "Skeleton",
              slug: "skeleton",
              helper_method: "eden_skeleton",
              description: "Placeholder loading skeleton.",
              has_block: false,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":text", description: "Skeleton type", options: %w[text card image avatar]),
                Param.new(name: :count, type: :integer, default: "1", description: "Number of skeleton items", options: nil)
              ]
            ),
            Component.new(
              name: "Progress",
              slug: "progress",
              helper_method: "eden_progress",
              description: "Progress bar showing completion percentage.",
              has_block: false,
              params: [
                Param.new(name: :value, type: :integer, default: "0", description: "Progress percentage (0-100)", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Bar height", options: %w[sm md lg]),
                Param.new(name: :variant, type: :symbol, default: ":primary", description: "Color variant", options: %w[primary success warning danger info dark]),
                Param.new(name: :label, type: :string, default: "nil", description: "Label text inside bar", options: nil)
              ]
            ),
            Component.new(
              name: "Rating",
              slug: "rating",
              helper_method: "eden_rating",
              description: "Star rating display.",
              has_block: false,
              params: [
                Param.new(name: :value, type: :number, default: "0", description: "Current rating value", options: nil),
                Param.new(name: :max, type: :integer, default: "5", description: "Maximum stars", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Star size", options: %w[sm md lg]),
                Param.new(name: :readonly, type: :boolean, default: "true", description: "Disable interaction", options: nil)
              ]
            ),
            Component.new(
              name: "Clipboard",
              slug: "clipboard",
              helper_method: "eden_clipboard",
              description: "Copy-to-clipboard button.",
              has_block: true,
              params: [
                Param.new(name: :target, type: :string, default: "nil", description: "CSS selector of element to copy", options: nil),
                Param.new(name: :text, type: :string, default: "nil", description: "Static text to copy", options: nil)
              ]
            ),
            Component.new(
              name: "Stepper",
              slug: "stepper",
              helper_method: "eden_stepper",
              description: "Multi-step progress indicator.",
              has_block: true,
              params: []
            ),
            Component.new(
              name: "Empty State",
              slug: "empty_state",
              helper_method: "eden_empty_state",
              description: "Placeholder for empty content areas with icon, message, and call to action.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Heading text", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Description text", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name to display", options: nil),
                Param.new(name: :action_text, type: :string, default: "nil", description: "CTA button text", options: nil),
                Param.new(name: :action_href, type: :string, default: "nil", description: "CTA button URL", options: nil)
              ]
            ),
            Component.new(
              name: "Divider",
              slug: "divider",
              helper_method: "eden_divider",
              description: "Horizontal divider line with optional centered text or icon.",
              has_block: false,
              params: [
                Param.new(name: :text, type: :string, default: "nil", description: "Text to display in the divider", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual style", options: %w[default primary dashed]),
                Param.new(name: :spacing, type: :symbol, default: ":md", description: "Vertical spacing", options: %w[sm md lg]),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name to display", options: nil)
              ]
            ),
            Component.new(
              name: "Error Page",
              slug: "error_page",
              helper_method: "eden_error_page",
              description: "Full-page centered error display with error code, title, description, and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :code, type: :string, default: '"404"', description: "Error code displayed large", options: nil),
                Param.new(name: :title, type: :string, default: '"Page not found"', description: "Error title heading", options: nil),
                Param.new(name: :description, type: :string, default: '"Sorry, we can\'t find that page."', description: "Description text", options: nil),
                Param.new(name: :back_href, type: :string, default: '"/"', description: "Primary back button URL", options: nil),
                Param.new(name: :back_text, type: :string, default: '"Go back home"', description: "Primary back button text", options: nil),
                Param.new(name: :support_href, type: :string, default: "nil", description: "Support link URL (hidden if nil)", options: nil),
                Param.new(name: :support_text, type: :string, default: '"Contact support"', description: "Support link text", options: nil)
              ]
            ),
            Component.new(
              name: "Maintenance Page",
              slug: "maintenance_page",
              helper_method: "eden_maintenance_page",
              description: "Full-page maintenance notice with icon, estimated time, and email notification form.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Under Maintenance"', description: "Page heading", options: nil),
                Param.new(name: :description, type: :string, default: '"We\'re working on improvements. We\'ll be back shortly."', description: "Description text", options: nil),
                Param.new(name: :estimated_time, type: :string, default: "nil", description: "Estimated downtime text (shown in badge)", options: nil),
                Param.new(name: :notify_url, type: :string, default: "nil", description: "Email notification form action URL", options: nil),
                Param.new(name: :notify_placeholder, type: :string, default: '"Enter your email"', description: "Email input placeholder text", options: nil)
              ]
            )
          ]
        },
        rich_content: {
          label: "Rich Content",
          icon: "photo",
          description: "Components for rich media and content display",
          components: [
            Component.new(
              name: "Carousel",
              slug: "carousel",
              helper_method: "eden_carousel",
              description: "Image/content slideshow with controls and indicators.",
              has_block: true,
              params: [
                Param.new(name: :indicators, type: :boolean, default: "true", description: "Show slide indicators", options: nil),
                Param.new(name: :controls, type: :boolean, default: "true", description: "Show prev/next controls", options: nil),
                Param.new(name: :slide, type: :boolean, default: "true", description: "Enable auto-sliding", options: nil)
              ]
            ),
            Component.new(
              name: "Gallery",
              slug: "gallery",
              helper_method: "eden_gallery",
              description: "Multi-column image gallery grid.",
              has_block: true,
              params: [
                Param.new(name: :columns, type: :integer, default: "3", description: "Number of grid columns", options: nil),
                Param.new(name: :gap, type: :integer, default: "4", description: "Gap between items (Tailwind scale)", options: nil)
              ]
            ),
            Component.new(
              name: "Device Mockup",
              slug: "device_mockup",
              helper_method: "eden_device_mockup",
              description: "Device frame mockup for showcasing content.",
              has_block: true,
              params: [
                Param.new(name: :device, type: :symbol, default: ":phone", description: "Device type", options: %w[phone tablet laptop desktop]),
                Param.new(name: :color, type: :symbol, default: ":default", description: "Device color", options: %w[default silver gold])
              ]
            ),
            Component.new(
              name: "Chat Bubble",
              slug: "chat_bubble",
              helper_method: "eden_chat_bubble",
              description: "Chat message bubble with sender info and delivery status.",
              has_block: true,
              params: [
                Param.new(name: :message, type: :string, default: "nil", description: "Message text", options: nil),
                Param.new(name: :sender, type: :string, default: "nil", description: "Sender name", options: nil),
                Param.new(name: :time, type: :string, default: "nil", description: "Timestamp text", options: nil),
                Param.new(name: :delivered, type: :boolean, default: "false", description: "Show delivery status", options: nil),
                Param.new(name: :avatar, type: :string, default: "nil", description: "Avatar image URL", options: nil),
                Param.new(name: :position, type: :symbol, default: ":left", description: "Bubble alignment", options: %w[left right])
              ]
            ),
            Component.new(
              name: "Footer",
              slug: "footer",
              helper_method: "eden_footer",
              description: "Page footer with branding and links.",
              has_block: true,
              params: [
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Footer style", options: %w[default sticky])
              ]
            ),
            Component.new(
              name: "Typing Indicator",
              slug: "typing_indicator",
              helper_method: "eden_typing_indicator",
              description: "Animated typing indicator for chat interfaces with bouncing dots.",
              has_block: false,
              params: [
                Param.new(name: :sender, type: :string, default: "nil", description: "Name of person typing", options: nil),
                Param.new(name: :avatar, type: :string, default: "nil", description: "Avatar image URL", options: nil)
              ]
            )
          ]
        },
        user_profile: {
          label: "User & Profile",
          icon: "user",
          description: "User profile, settings, and account management components",
          components: [
            Component.new(
              name: "Profile Header",
              slug: "profile_header",
              helper_method: "eden_profile_header",
              description: "User profile header with cover band, avatar, name, stats, and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "User display name (required)", options: nil),
                Param.new(name: :role, type: :string, default: "nil", description: "Job title or role text", options: nil),
                Param.new(name: :email, type: :string, default: "nil", description: "Email address", options: nil),
                Param.new(name: :location, type: :string, default: "nil", description: "Location text", options: nil),
                Param.new(name: :avatar_src, type: :string, default: "nil", description: "Avatar image URL", options: nil),
                Param.new(name: :avatar_initials, type: :string, default: "nil", description: "Fallback avatar initials", options: nil),
                Param.new(name: :stats, type: :array, default: "[]", description: "Array of {label:, value:} stat items", options: nil),
                Param.new(name: :cover_color, type: :symbol, default: ":primary", description: "Cover band color", options: %w[primary success warning danger dark indigo purple])
              ]
            ),
            Component.new(
              name: "User Card",
              slug: "user_card",
              helper_method: "eden_user_card",
              description: "Compact user card with avatar, name, role, status badge, and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "User display name (required)", options: nil),
                Param.new(name: :email, type: :string, default: "nil", description: "Email address", options: nil),
                Param.new(name: :role, type: :string, default: "nil", description: "Job title or role text", options: nil),
                Param.new(name: :status, type: :symbol, default: "nil", description: "User status", options: %w[active inactive pending]),
                Param.new(name: :avatar_src, type: :string, default: "nil", description: "Avatar image URL", options: nil),
                Param.new(name: :avatar_initials, type: :string, default: "nil", description: "Fallback avatar initials", options: nil)
              ]
            ),
            Component.new(
              name: "Avatar Upload",
              slug: "avatar_upload",
              helper_method: "eden_avatar_upload",
              description: "Avatar display with upload button, remove link, and hidden file input.",
              has_block: false,
              params: [
                Param.new(name: :src, type: :string, default: "nil", description: "Current avatar image URL", options: nil),
                Param.new(name: :initials, type: :string, default: "nil", description: "Fallback avatar initials", options: nil),
                Param.new(name: :name, type: :string, default: '"avatar"', description: "HTML name attribute for file input", options: nil),
                Param.new(name: :id, type: :string, default: '"avatar-upload"', description: "HTML id attribute for file input", options: nil),
                Param.new(name: :accept, type: :string, default: '"image/*"', description: "Accepted file types", options: nil)
              ]
            ),
            Component.new(
              name: "Settings Section",
              slug: "settings_section",
              helper_method: "eden_settings_section",
              description: "Card-based settings section with title, description, divider, and form content.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Section title (required)", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Description text below title", options: nil),
                Param.new(name: :collapsible, type: :boolean, default: "false", description: "Allow section to be collapsed", options: nil)
              ]
            )
          ]
        },
        mailing: {
          label: "Mailing & Notifications",
          icon: "envelope",
          description: "Inbox, message view, and notification components",
          components: [
            Component.new(
              name: "Inbox Toolbar",
              slug: "inbox_toolbar",
              helper_method: "eden_inbox_toolbar",
              description: "Toolbar for inbox with select-all, action buttons, and selected count.",
              has_block: true,
              params: [
                Param.new(name: :selected_count, type: :integer, default: "0", description: "Number of selected items", options: nil)
              ]
            ),
            Component.new(
              name: "Inbox Item",
              slug: "inbox_item",
              helper_method: "eden_inbox_item",
              description: "Single inbox message row with sender, subject, preview, star, and unread state.",
              has_block: true,
              params: [
                Param.new(name: :sender, type: :string, default: "nil", description: "Sender name (required)", options: nil),
                Param.new(name: :subject, type: :string, default: "nil", description: "Message subject (required)", options: nil),
                Param.new(name: :preview, type: :string, default: "nil", description: "Message preview text (truncated)", options: nil),
                Param.new(name: :time, type: :string, default: "nil", description: "Timestamp text", options: nil),
                Param.new(name: :unread, type: :boolean, default: "false", description: "Unread state with blue bg and bold text", options: nil),
                Param.new(name: :selected, type: :boolean, default: "false", description: "Checkbox selected state", options: nil),
                Param.new(name: :starred, type: :boolean, default: "false", description: "Star filled state", options: nil),
                Param.new(name: :avatar_src, type: :string, default: "nil", description: "Sender avatar image URL", options: nil),
                Param.new(name: :avatar_initials, type: :string, default: "nil", description: "Sender fallback initials", options: nil)
              ]
            ),
            Component.new(
              name: "Message View",
              slug: "message_view",
              helper_method: "eden_message_view",
              description: "Full message reading view with sender header, subject, body, and reply/forward buttons.",
              has_block: true,
              params: [
                Param.new(name: :sender, type: :string, default: "nil", description: "Sender name (required)", options: nil),
                Param.new(name: :sender_email, type: :string, default: "nil", description: "Sender email address", options: nil),
                Param.new(name: :recipient, type: :string, default: "nil", description: "Recipient name or email", options: nil),
                Param.new(name: :subject, type: :string, default: "nil", description: "Message subject line", options: nil),
                Param.new(name: :time, type: :string, default: "nil", description: "Timestamp text", options: nil),
                Param.new(name: :avatar_src, type: :string, default: "nil", description: "Sender avatar image URL", options: nil),
                Param.new(name: :avatar_initials, type: :string, default: "nil", description: "Sender fallback initials", options: nil)
              ]
            ),
            Component.new(
              name: "Notification Item",
              slug: "notification_item",
              helper_method: "eden_notification_item",
              description: "Single notification row with icon, title, body, time, and read/unread state.",
              has_block: false,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Notification title (required)", options: nil),
                Param.new(name: :body, type: :string, default: "nil", description: "Notification body text", options: nil),
                Param.new(name: :time, type: :string, default: "nil", description: "Timestamp text", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Icon name for the colored circle", options: nil),
                Param.new(name: :read, type: :boolean, default: "false", description: "Read state (hides unread dot)", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Makes notification a clickable link", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Icon circle color variant", options: %w[default info success warning danger])
              ]
            ),
            Component.new(
              name: "Notification List",
              slug: "notification_list",
              helper_method: "eden_notification_list",
              description: "Card container for notifications with header, unread count, mark-all link, and empty state.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Notifications"', description: "Header title", options: nil),
                Param.new(name: :notifications, type: :array, default: "[]", description: "Array of notification hashes", options: nil),
                Param.new(name: :mark_all_url, type: :string, default: "nil", description: "Mark all as read link URL", options: nil),
                Param.new(name: :view_all_url, type: :string, default: "nil", description: "View all notifications link URL", options: nil)
              ]
            )
          ]
        },
        icons: {
          label: "Icons",
          icon: "star",
          description: "SVG icon library with multiple sizes",
          components: [
            Component.new(
              name: "Icon",
              slug: "icon",
              helper_method: "eden_icon",
              description: "Heroicons-style SVG icon with configurable size.",
              has_block: false,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "Icon name (required)", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Icon size", options: %w[xs sm md lg xl])
              ]
            )
          ]
        },
        project_management: {
          label: "Project Management",
          icon: "clipboard",
          description: "Kanban boards, task lists, and project tracking components",
          components: [
            Component.new(
              name: "Kanban Board",
              slug: "kanban_board",
              helper_method: "eden_kanban_board",
              description: "Horizontal scrolling container for kanban columns.",
              has_block: true,
              params: []
            ),
            Component.new(
              name: "Kanban Column",
              slug: "kanban_column",
              helper_method: "eden_kanban_column",
              description: "Column within a kanban board with colored header and card container.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Column title", options: nil),
                Param.new(name: :count, type: :integer, default: "nil", description: "Item count badge", options: nil),
                Param.new(name: :color, type: :symbol, default: ":default", description: "Top border and header dot color", options: %w[default primary success warning danger])
              ]
            ),
            Component.new(
              name: "Kanban Card",
              slug: "kanban_card",
              helper_method: "eden_kanban_card",
              description: "Draggable card for kanban boards with priority, tags, assignees, and due date.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Card title (required)", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Short description text", options: nil),
                Param.new(name: :priority, type: :symbol, default: "nil", description: "Priority indicator dot", options: %w[high medium low]),
                Param.new(name: :due_date, type: :string, default: "nil", description: "Due date text", options: nil),
                Param.new(name: :assignees, type: :array, default: "[]", description: "Array of {name:, initials:} or {name:, src:}", options: nil),
                Param.new(name: :tags, type: :array, default: "[]", description: "Array of {label:, color:} for tag badges", options: nil)
              ]
            ),
            Component.new(
              name: "Task List",
              slug: "task_list",
              helper_method: "eden_task_list",
              description: "Card container for task items with optional title and priority grouping.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "List heading", options: nil),
                Param.new(name: :tasks, type: :array, default: "[]", description: "Array of task hashes {title:, completed:, priority:, assignee:, due_date:}", options: nil)
              ]
            ),
            Component.new(
              name: "Task Item",
              slug: "task_item",
              helper_method: "eden_task_item",
              description: "Single task row with checkbox, priority dot, and metadata.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Task title (required)", options: nil),
                Param.new(name: :completed, type: :boolean, default: "false", description: "Checked/completed state", options: nil),
                Param.new(name: :priority, type: :symbol, default: ":medium", description: "Priority indicator color", options: %w[high medium low]),
                Param.new(name: :assignee, type: :string, default: "nil", description: "Assignee name text", options: nil),
                Param.new(name: :due_date, type: :string, default: "nil", description: "Due date text", options: nil)
              ]
            ),
            Component.new(
              name: "Project Card",
              slug: "project_card",
              helper_method: "eden_project_card",
              description: "Project overview card with status, progress bar, team avatars, and due date.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Project name (required)", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Project description", options: nil),
                Param.new(name: :status, type: :symbol, default: ":active", description: "Project status badge", options: %w[active completed on_hold at_risk]),
                Param.new(name: :progress, type: :integer, default: "0", description: "Completion percentage (0-100)", options: nil),
                Param.new(name: :team, type: :array, default: "[]", description: "Array of {name:, initials:} or {name:, src:}", options: nil),
                Param.new(name: :due_date, type: :string, default: "nil", description: "Due date text", options: nil)
              ]
            )
          ]
        },
        calendar_events: {
          label: "Calendar & Events",
          icon: "calendar",
          description: "Calendar views and event scheduling components",
          components: [
            Component.new(
              name: "Calendar",
              slug: "calendar",
              helper_method: "eden_calendar",
              description: "Monthly calendar grid with event indicators and navigation.",
              has_block: false,
              params: [
                Param.new(name: :month, type: :integer, default: "Date.current.month", description: "Month number (1-12)", options: nil),
                Param.new(name: :year, type: :integer, default: "Date.current.year", description: "Year number", options: nil),
                Param.new(name: :events, type: :array, default: "[]", description: "Array of {date:, title:, color:}", options: nil),
                Param.new(name: :start_day, type: :symbol, default: ":sunday", description: "First day of week", options: %w[sunday monday])
              ]
            ),
            Component.new(
              name: "Event Card",
              slug: "event_card",
              helper_method: "eden_event_card",
              description: "Single event display with colored left border, time, location, and description.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Event title (required)", options: nil),
                Param.new(name: :start_time, type: :string, default: "nil", description: "Start time text", options: nil),
                Param.new(name: :end_time, type: :string, default: "nil", description: "End time text", options: nil),
                Param.new(name: :location, type: :string, default: "nil", description: "Location text", options: nil),
                Param.new(name: :color, type: :symbol, default: ":primary", description: "Left border color", options: %w[primary success warning danger purple]),
                Param.new(name: :description, type: :string, default: "nil", description: "Event description text", options: nil)
              ]
            ),
            Component.new(
              name: "Event List",
              slug: "event_list",
              helper_method: "eden_event_list",
              description: "List of events optionally grouped by date with sticky headers.",
              has_block: false,
              params: [
                Param.new(name: :events, type: :array, default: "[]", description: "Array of event hashes {date:, title:, start_time:, end_time:, location:, color:}", options: nil),
                Param.new(name: :grouped, type: :boolean, default: "true", description: "Group events by date with headers", options: nil)
              ]
            )
          ]
        },
        admin_dashboard: {
          label: "Admin & Dashboard",
          icon: "chart-bar",
          description: "Page headers, toolbars, data tables, and CRUD patterns for admin dashboards",
          components: [
            Component.new(
              name: "Page Header",
              slug: "page_header",
              helper_method: "eden_page_header",
              description: "Top-of-page header with breadcrumbs, title, description, and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Page title (required)", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Subtitle text below the title", options: nil),
                Param.new(name: :breadcrumbs, type: :array, default: "[]", description: "Array of {label:, href:} for breadcrumb nav", options: nil)
              ]
            ),
            Component.new(
              name: "Section Header",
              slug: "section_header",
              helper_method: "eden_section_header",
              description: "Section divider with title, subtitle, and optional action link.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Section title (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Subtitle text", options: nil),
                Param.new(name: :action_text, type: :string, default: "nil", description: "Action link text", options: nil),
                Param.new(name: :action_href, type: :string, default: "nil", description: "Action link URL", options: nil)
              ]
            ),
            Component.new(
              name: "Toolbar",
              slug: "toolbar",
              helper_method: "eden_toolbar",
              description: "Horizontal bar with search input and action buttons for filtering and actions.",
              has_block: true,
              params: [
                Param.new(name: :search_placeholder, type: :string, default: '"Search..."', description: "Search input placeholder", options: nil),
                Param.new(name: :search_name, type: :string, default: '"search"', description: "Search input name attribute", options: nil),
                Param.new(name: :search_value, type: :string, default: "nil", description: "Pre-filled search value", options: nil)
              ]
            ),
            Component.new(
              name: "Chart Card",
              slug: "chart_card",
              helper_method: "eden_chart_card",
              description: "Dashboard card with title, value, chart placeholder area, and footer.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Card title (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Subtitle below title", options: nil),
                Param.new(name: :value, type: :string, default: "nil", description: "Large display value", options: nil),
                Param.new(name: :chart_id, type: :string, default: "nil", description: "DOM id for JS chart library", options: nil)
              ]
            ),
            Component.new(
              name: "Activity Timeline",
              slug: "activity_timeline",
              helper_method: "eden_activity_timeline",
              description: "Vertical timeline of user activity events with colored dots and timestamps.",
              has_block: true,
              params: [
                Param.new(name: :items, type: :array, default: "[]", description: "Array of {name:, action:, target:, time:, color:, avatar:, icon:}", options: nil)
              ]
            ),
            Component.new(
              name: "Data Table",
              slug: "data_table",
              helper_method: "eden_data_table",
              description: "Data-driven table with column definitions, sortable headers, and selectable rows.",
              has_block: true,
              params: [
                Param.new(name: :columns, type: :array, default: "[]", description: "Array of {label:, key:, sortable:} column defs", options: nil),
                Param.new(name: :rows, type: :array, default: "[]", description: "Array of row hashes {key: value}", options: nil),
                Param.new(name: :striped, type: :boolean, default: "false", description: "Alternating row backgrounds", options: nil),
                Param.new(name: :hoverable, type: :boolean, default: "true", description: "Highlight rows on hover", options: nil),
                Param.new(name: :selectable, type: :boolean, default: "false", description: "Show checkbox column for selection", options: nil)
              ]
            ),
            Component.new(
              name: "Table Toolbar",
              slug: "table_toolbar",
              helper_method: "eden_table_toolbar",
              description: "Toolbar above a table with title, count badge, search, and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Toolbar title", options: nil),
                Param.new(name: :count, type: :integer, default: "nil", description: "Record count displayed as badge", options: nil),
                Param.new(name: :search_placeholder, type: :string, default: '"Search..."', description: "Search input placeholder", options: nil),
                Param.new(name: :search_name, type: :string, default: '"q"', description: "Search input name attribute", options: nil)
              ]
            ),
            Component.new(
              name: "Filter Dropdown",
              slug: "filter_dropdown",
              helper_method: "eden_filter_dropdown",
              description: "Dropdown button with a panel for filter form content.",
              has_block: true,
              params: [
                Param.new(name: :label, type: :string, default: '"Filter"', description: "Button label text", options: nil),
                Param.new(name: :icon, type: :string, default: "nil", description: "Optional icon (filter icon shown when set)", options: nil),
                Param.new(name: :open, type: :boolean, default: "false", description: "Whether dropdown starts open", options: nil)
              ]
            ),
            Component.new(
              name: "CRUD Modal",
              slug: "crud_modal",
              helper_method: "eden_crud_modal",
              description: "Modal dialog wrapping a form for create/edit operations.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Modal DOM id (required)", options: nil),
                Param.new(name: :title, type: :string, default: "nil", description: "Modal header title (required)", options: nil),
                Param.new(name: :size, type: :symbol, default: ":md", description: "Modal width", options: %w[sm md lg xl]),
                Param.new(name: :submit_text, type: :string, default: '"Save"', description: "Submit button text", options: nil),
                Param.new(name: :cancel_text, type: :string, default: '"Cancel"', description: "Cancel button text", options: nil),
                Param.new(name: :form_url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :form_method, type: :symbol, default: ":post", description: "Form HTTP method", options: %w[get post put patch delete])
              ]
            ),
            Component.new(
              name: "Delete Confirm",
              slug: "delete_confirm",
              helper_method: "eden_delete_confirm",
              description: "Confirmation dialog for destructive actions with warning icon.",
              has_block: false,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Modal DOM id (required)", options: nil),
                Param.new(name: :title, type: :string, default: '"Confirm Deletion"', description: "Dialog heading", options: nil),
                Param.new(name: :message, type: :string, default: '"Are you sure? This action cannot be undone."', description: "Warning message", options: nil),
                Param.new(name: :confirm_text, type: :string, default: '"Delete"', description: "Confirm button text", options: nil),
                Param.new(name: :cancel_text, type: :string, default: '"Cancel"', description: "Cancel button text", options: nil),
                Param.new(name: :form_url, type: :string, default: '"#"', description: "Form action URL for deletion", options: nil),
                Param.new(name: :form_method, type: :symbol, default: ":delete", description: "Form HTTP method", options: %w[delete])
              ]
            ),
            Component.new(
              name: "Bulk Action Bar",
              slug: "bulk_action_bar",
              helper_method: "eden_bulk_action_bar",
              description: "Fixed bottom bar showing selected count and batch action buttons.",
              has_block: true,
              params: [
                Param.new(name: :count, type: :integer, default: "0", description: "Number of selected items", options: nil),
                Param.new(name: :visible, type: :boolean, default: "false", description: "Whether the bar is visible", options: nil)
              ]
            ),
            Component.new(
              name: "Integration Card",
              slug: "integration_card",
              helper_method: "eden_integration_card",
              description: "Card for third-party integrations with icon, status badge, and toggle control.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "Integration name (required)", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Short description of the integration", options: nil),
                Param.new(name: :icon_src, type: :string, default: "nil", description: "Icon image URL", options: nil),
                Param.new(name: :icon_svg, type: :string, default: "nil", description: "Inline SVG icon HTML", options: nil),
                Param.new(name: :connected, type: :boolean, default: "false", description: "Connected status (green badge vs gray)", options: nil),
                Param.new(name: :enabled, type: :boolean, default: "true", description: "Show toggle control when no block", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Makes name a clickable link", options: nil),
                Param.new(name: :category, type: :string, default: "nil", description: "Category badge text", options: nil)
              ]
            ),
            Component.new(
              name: "API Endpoint",
              slug: "api_endpoint",
              helper_method: "eden_api_endpoint",
              description: "API endpoint documentation card with method badge, parameters table, and response example.",
              has_block: true,
              params: [
                Param.new(name: :method, type: :symbol, default: ":get", description: "HTTP method (determines color)", options: %w[get post put patch delete]),
                Param.new(name: :path, type: :string, default: '"/"', description: "Endpoint path in monospace font", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Endpoint description text", options: nil),
                Param.new(name: :params, type: :array, default: "[]", description: "Array of {name:, type:, required:, description:}", options: nil),
                Param.new(name: :response_example, type: :string, default: "nil", description: "JSON response example in code block", options: nil),
                Param.new(name: :auth_required, type: :boolean, default: "true", description: "Show auth required badge", options: nil)
              ]
            )
          ]
        },
        marketing_sections: {
          label: "Marketing Sections",
          icon: "star",
          description: "Self-contained section blocks for marketing and landing pages",
          components: [
            Component.new(
              name: "Hero Section",
              slug: "hero_section",
              helper_method: "eden_hero_section",
              description: "Full-width hero area with headline, subtitle, CTAs, optional badge, and image. Supports centered, split, and gradient variants.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Main headline text (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text below the headline", options: nil),
                Param.new(name: :primary_cta_text, type: :string, default: "nil", description: "Primary button label", options: nil),
                Param.new(name: :primary_cta_href, type: :string, default: '"#"', description: "Primary button URL", options: nil),
                Param.new(name: :secondary_cta_text, type: :string, default: "nil", description: "Secondary button label", options: nil),
                Param.new(name: :secondary_cta_href, type: :string, default: '"#"', description: "Secondary button URL", options: nil),
                Param.new(name: :image, type: :string, default: "nil", description: "Hero image URL (used in :split variant)", options: nil),
                Param.new(name: :image_alt, type: :string, default: "nil", description: "Alt text for the hero image", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":centered", description: "Layout variant", options: %w[centered split gradient]),
                Param.new(name: :badge_text, type: :string, default: "nil", description: "Pill badge above the title", options: nil)
              ]
            ),
            Component.new(
              name: "Feature Section",
              slug: "feature_section",
              helper_method: "eden_feature_section",
              description: "Feature showcase grid with icons, titles, and descriptions. Supports grid, list, and icons-only variants.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Section heading (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text below the heading", options: nil),
                Param.new(name: :features, type: :array, default: "[]", description: "Array of {title:, description:, icon:, color:}", options: nil),
                Param.new(name: :columns, type: :integer, default: "3", description: "Number of grid columns", options: %w[2 3 4]),
                Param.new(name: :variant, type: :symbol, default: ":grid", description: "Layout variant", options: %w[grid list icons_only])
              ]
            ),
            Component.new(
              name: "Customer Logos",
              slug: "customer_logos",
              helper_method: "eden_customer_logos",
              description: "Logo bar showcasing customer or partner brands with grayscale hover effect.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Trusted by"', description: "Section label text", options: nil),
                Param.new(name: :logos, type: :array, default: "[]", description: "Array of {name:, src:, href:}", options: nil)
              ]
            ),
            Component.new(
              name: "CTA Section",
              slug: "cta_section",
              helper_method: "eden_cta_section",
              description: "Call-to-action section with title, subtitle, and buttons. Supports centered, split, and gradient variants.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "CTA headline (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :primary_cta_text, type: :string, default: "nil", description: "Primary button label", options: nil),
                Param.new(name: :primary_cta_href, type: :string, default: '"#"', description: "Primary button URL", options: nil),
                Param.new(name: :secondary_cta_text, type: :string, default: "nil", description: "Secondary button label", options: nil),
                Param.new(name: :secondary_cta_href, type: :string, default: '"#"', description: "Secondary button URL", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":centered", description: "Layout variant", options: %w[centered split gradient])
              ]
            ),
            Component.new(
              name: "Pricing Section",
              slug: "pricing_section",
              helper_method: "eden_pricing_section",
              description: "Pricing plan cards with features, CTA buttons, and optional billing toggle.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Pricing"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :plans, type: :array, default: "[]", description: "Array of {name:, price:, period:, description:, features:[], cta_text:, cta_href:, popular:}", options: nil),
                Param.new(name: :billing_toggle, type: :boolean, default: "false", description: "Show monthly/annual billing toggle", options: nil)
              ]
            ),
            Component.new(
              name: "Team Section",
              slug: "team_section",
              helper_method: "eden_team_section",
              description: "Team member grid with avatars, names, roles, bios, and social links.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Our Team"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :members, type: :array, default: "[]", description: "Array of {name:, role:, bio:, avatar_src:, avatar_initials:, social:[]}", options: nil),
                Param.new(name: :columns, type: :integer, default: "4", description: "Number of grid columns", options: %w[2 3 4])
              ]
            ),
            Component.new(
              name: "Testimonial Section",
              slug: "testimonial_section",
              helper_method: "eden_testimonial_section",
              description: "Customer testimonials with quotes, ratings, and author info. Supports grid, featured, and carousel variants.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Testimonials"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :testimonials, type: :array, default: "[]", description: "Array of {quote:, author:, role:, company:, avatar_src:, avatar_initials:, rating:}", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":grid", description: "Layout variant", options: %w[grid featured carousel])
              ]
            ),
            Component.new(
              name: "Contact Section",
              slug: "contact_section",
              helper_method: "eden_contact_section",
              description: "Two-column contact section with info cards and a form. Block content replaces the default form.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Contact Us"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :form_url, type: :string, default: '"#"', description: "Form action URL", options: nil),
                Param.new(name: :form_method, type: :symbol, default: ":post", description: "Form HTTP method", options: %w[get post]),
                Param.new(name: :show_info, type: :boolean, default: "true", description: "Show contact info cards", options: nil),
                Param.new(name: :email, type: :string, default: "nil", description: "Contact email address", options: nil),
                Param.new(name: :phone, type: :string, default: "nil", description: "Contact phone number", options: nil),
                Param.new(name: :address, type: :string, default: "nil", description: "Physical address", options: nil)
              ]
            ),
            Component.new(
              name: "Blog Section",
              slug: "blog_section",
              helper_method: "eden_blog_section",
              description: "Blog post grid with article cards, images, category badges, and author info.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"Latest Articles"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :posts, type: :array, default: "[]", description: "Array of {title:, excerpt:, date:, author:, category:, image:, href:}", options: nil),
                Param.new(name: :columns, type: :integer, default: "3", description: "Number of grid columns", options: %w[1 2 3])
              ]
            ),
            Component.new(
              name: "FAQ Section",
              slug: "faq_section",
              helper_method: "eden_faq_section",
              description: "Frequently asked questions using accordion items. Supports single or two-column layout.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: '"FAQ"', description: "Section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :questions, type: :array, default: "[]", description: "Array of {question:, answer:}", options: nil),
                Param.new(name: :columns, type: :integer, default: "1", description: "Number of columns for questions", options: %w[1 2])
              ]
            ),
            Component.new(
              name: "Stats Section",
              slug: "stats_section",
              helper_method: "eden_stats_section",
              description: "Statistics display with large numbers and labels. Supports default, cards, and colored variants.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Optional section heading", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :stats, type: :array, default: "[]", description: "Array of {value:, label:, description:}", options: nil),
                Param.new(name: :variant, type: :symbol, default: ":default", description: "Visual variant", options: %w[default cards colored])
              ]
            ),
            Component.new(
              name: "Content Section",
              slug: "content_section",
              helper_method: "eden_content_section",
              description: "Two-column content area with text, features, and an image. Image position is configurable.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Section heading (required)", options: nil),
                Param.new(name: :subtitle, type: :string, default: "nil", description: "Supporting text", options: nil),
                Param.new(name: :body, type: :string, default: "nil", description: "HTML body content", options: nil),
                Param.new(name: :image, type: :string, default: "nil", description: "Image URL", options: nil),
                Param.new(name: :image_alt, type: :string, default: "nil", description: "Image alt text", options: nil),
                Param.new(name: :image_position, type: :symbol, default: ":right", description: "Image placement", options: %w[left right]),
                Param.new(name: :features, type: :array, default: "[]", description: "Array of {title:, description:, icon:}", options: nil)
              ]
            )
          ]
        },
        ecommerce: {
          label: "E-Commerce",
          icon: "shopping-cart",
          description: "Invoices, pricing plans, transactions, products, and order summaries",
          components: [
            Component.new(
              name: "Invoice",
              slug: "invoice",
              helper_method: "eden_invoice",
              description: "Complete invoice document with header, line items, totals, and status.",
              has_block: true,
              params: [
                Param.new(name: :invoice_number, type: :string, default: "nil", description: "Invoice number", options: nil),
                Param.new(name: :date, type: :string, default: "nil", description: "Invoice date", options: nil),
                Param.new(name: :due_date, type: :string, default: "nil", description: "Payment due date", options: nil),
                Param.new(name: :from, type: :hash, default: "{}", description: "Sender info {name:, address:, email:}", options: nil),
                Param.new(name: :to, type: :hash, default: "{}", description: "Recipient info {name:, address:, email:}", options: nil),
                Param.new(name: :items, type: :array, default: "[]", description: "Array of line item hashes", options: nil),
                Param.new(name: :subtotal, type: :string, default: "nil", description: "Subtotal amount", options: nil),
                Param.new(name: :tax, type: :string, default: "nil", description: "Tax amount", options: nil),
                Param.new(name: :total, type: :string, default: "nil", description: "Grand total amount", options: nil),
                Param.new(name: :status, type: :symbol, default: ":pending", description: "Invoice status", options: %w[pending paid overdue cancelled])
              ]
            ),
            Component.new(
              name: "Invoice Item",
              slug: "invoice_item",
              helper_method: "eden_invoice_item",
              description: "Single invoice line item row for use inside a table.",
              has_block: false,
              params: [
                Param.new(name: :description, type: :string, default: "nil", description: "Item description", options: nil),
                Param.new(name: :quantity, type: :integer, default: "1", description: "Item quantity", options: nil),
                Param.new(name: :unit_price, type: :string, default: "nil", description: "Price per unit", options: nil),
                Param.new(name: :total, type: :string, default: "nil", description: "Line total", options: nil)
              ]
            ),
            Component.new(
              name: "Plan Card",
              slug: "plan_card",
              helper_method: "eden_plan_card",
              description: "Pricing plan card with features list, CTA button, and popular badge.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "Plan name", options: nil),
                Param.new(name: :price, type: :string, default: "nil", description: "Price display text", options: nil),
                Param.new(name: :period, type: :string, default: '"/month"', description: "Billing period text", options: nil),
                Param.new(name: :description, type: :string, default: "nil", description: "Plan description", options: nil),
                Param.new(name: :features, type: :array, default: "[]", description: "Array of feature strings", options: nil),
                Param.new(name: :current, type: :boolean, default: "false", description: "Currently active plan", options: nil),
                Param.new(name: :popular, type: :boolean, default: "false", description: "Show popular badge", options: nil),
                Param.new(name: :cta_text, type: :string, default: '"Upgrade"', description: "CTA button text", options: nil)
              ]
            ),
            Component.new(
              name: "Transaction Item",
              slug: "transaction_item",
              helper_method: "eden_transaction_item",
              description: "Single transaction row with amount, type indicator, and status badge.",
              has_block: true,
              params: [
                Param.new(name: :description, type: :string, default: "nil", description: "Transaction description", options: nil),
                Param.new(name: :amount, type: :string, default: "nil", description: "Amount text", options: nil),
                Param.new(name: :type, type: :symbol, default: ":credit", description: "Transaction type", options: %w[credit debit]),
                Param.new(name: :status, type: :symbol, default: ":completed", description: "Transaction status", options: %w[completed pending failed]),
                Param.new(name: :date, type: :string, default: "nil", description: "Transaction date", options: nil)
              ]
            ),
            Component.new(
              name: "Product Card",
              slug: "product_card",
              helper_method: "eden_product_card",
              description: "E-commerce product card with image, price, rating, and badge.",
              has_block: true,
              params: [
                Param.new(name: :title, type: :string, default: "nil", description: "Product name", options: nil),
                Param.new(name: :price, type: :string, default: "nil", description: "Price text", options: nil),
                Param.new(name: :image, type: :string, default: "nil", description: "Product image URL", options: nil),
                Param.new(name: :category, type: :string, default: "nil", description: "Category label", options: nil),
                Param.new(name: :rating, type: :integer, default: "nil", description: "Star rating (1-5)", options: nil),
                Param.new(name: :badge_text, type: :string, default: "nil", description: "Badge text (e.g. Sale, New)", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Product link URL", options: nil)
              ]
            ),
            Component.new(
              name: "Order Summary",
              slug: "order_summary",
              helper_method: "eden_order_summary",
              description: "Order totals breakdown with subtotal, tax, shipping, discount, and grand total.",
              has_block: true,
              params: [
                Param.new(name: :subtotal, type: :string, default: "nil", description: "Subtotal amount", options: nil),
                Param.new(name: :tax, type: :string, default: "nil", description: "Tax amount", options: nil),
                Param.new(name: :shipping, type: :string, default: "nil", description: "Shipping cost", options: nil),
                Param.new(name: :discount, type: :string, default: "nil", description: "Discount amount", options: nil),
                Param.new(name: :total, type: :string, default: "nil", description: "Grand total", options: nil)
              ]
            )
          ]
        },
        status_monitoring: {
          label: "Status & Monitoring",
          icon: "signal",
          description: "Service status indicators, incident timelines, and status banners",
          components: [
            Component.new(
              name: "Service Status",
              slug: "service_status",
              helper_method: "eden_service_status",
              description: "Service status row with name, status indicator, uptime, and response time.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "Service name", options: nil),
                Param.new(name: :status, type: :symbol, default: ":operational", description: "Current status", options: %w[operational degraded partial_outage major_outage maintenance]),
                Param.new(name: :uptime, type: :string, default: "nil", description: "Uptime percentage text", options: nil),
                Param.new(name: :response_time, type: :string, default: "nil", description: "Response time text", options: nil)
              ]
            ),
            Component.new(
              name: "Incident Timeline",
              slug: "incident_timeline",
              helper_method: "eden_incident_timeline",
              description: "Timeline of incidents with severity indicators and timestamps.",
              has_block: true,
              params: [
                Param.new(name: :incidents, type: :array, default: "[]", description: "Array of {title:, status:, time:, description:, severity:}", options: nil)
              ]
            ),
            Component.new(
              name: "Status Banner",
              slug: "status_banner",
              helper_method: "eden_status_banner",
              description: "Global status banner with colored indicator and optional link.",
              has_block: false,
              params: [
                Param.new(name: :status, type: :symbol, default: ":operational", description: "Overall status", options: %w[operational degraded outage maintenance]),
                Param.new(name: :message, type: :string, default: "nil", description: "Banner message text", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Link URL for more details", options: nil)
              ]
            )
          ]
        },
        file_management: {
          label: "File Management",
          icon: "document",
          description: "File cards, file lists, and document management components",
          components: [
            Component.new(
              name: "File Card",
              slug: "file_card",
              helper_method: "eden_file_card",
              description: "File display card with icon, name, size, type, and modified date.",
              has_block: true,
              params: [
                Param.new(name: :name, type: :string, default: "nil", description: "File name", options: nil),
                Param.new(name: :size, type: :string, default: "nil", description: "File size text", options: nil),
                Param.new(name: :type, type: :string, default: "nil", description: "File type/extension", options: nil),
                Param.new(name: :modified, type: :string, default: "nil", description: "Last modified date", options: nil),
                Param.new(name: :href, type: :string, default: "nil", description: "Download/view link", options: nil)
              ]
            ),
            Component.new(
              name: "File List",
              slug: "file_list",
              helper_method: "eden_file_list",
              description: "List of files with name, size, type columns and action buttons.",
              has_block: true,
              params: [
                Param.new(name: :files, type: :array, default: "[]", description: "Array of file hashes {name:, size:, type:, modified:, href:}", options: nil)
              ]
            )
          ]
        },
        support: {
          label: "Support & Tickets",
          icon: "question-mark-circle",
          description: "Help desk tickets, ticket detail views, and support components",
          components: [
            Component.new(
              name: "Ticket Item",
              slug: "ticket_item",
              helper_method: "eden_ticket_item",
              description: "Support ticket list row with ID, subject, status, priority, and assignee.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Ticket ID", options: nil),
                Param.new(name: :subject, type: :string, default: "nil", description: "Ticket subject", options: nil),
                Param.new(name: :requester, type: :string, default: "nil", description: "Requester name", options: nil),
                Param.new(name: :status, type: :symbol, default: ":open", description: "Ticket status", options: %w[open in_progress resolved closed]),
                Param.new(name: :priority, type: :symbol, default: ":medium", description: "Priority level", options: %w[low medium high urgent]),
                Param.new(name: :assignee, type: :string, default: "nil", description: "Assigned agent name", options: nil),
                Param.new(name: :created_at, type: :string, default: "nil", description: "Creation timestamp", options: nil)
              ]
            ),
            Component.new(
              name: "Ticket Detail",
              slug: "ticket_detail",
              helper_method: "eden_ticket_detail",
              description: "Full ticket view with header, metadata sidebar, and message thread.",
              has_block: true,
              params: [
                Param.new(name: :id, type: :string, default: "nil", description: "Ticket ID", options: nil),
                Param.new(name: :subject, type: :string, default: "nil", description: "Ticket subject", options: nil),
                Param.new(name: :status, type: :symbol, default: ":open", description: "Ticket status", options: %w[open in_progress resolved closed]),
                Param.new(name: :priority, type: :symbol, default: ":medium", description: "Priority level", options: %w[low medium high urgent]),
                Param.new(name: :requester, type: :hash, default: "{}", description: "Requester info {name:, email:}", options: nil),
                Param.new(name: :assignee, type: :string, default: "nil", description: "Assigned agent name", options: nil),
                Param.new(name: :created_at, type: :string, default: "nil", description: "Creation timestamp", options: nil),
                Param.new(name: :messages, type: :array, default: "[]", description: "Array of message hashes", options: nil)
              ]
            )
          ]
        }
      }.freeze

      LAYOUTS = {
        app: { label: "App Layout", description: "Full application layout with navbar, sidebar, and footer" },
        chat: { label: "Chat Layout", description: "Chat interface with conversation sidebar and message area" },
        marketing: { label: "Marketing Layout", description: "Marketing site with navbar, hero, and footer" },
        auth: { label: "Auth Layout", description: "Authentication pages with centered card" }
      }.freeze

      def self.categories
        CATEGORIES
      end

      def self.layouts
        LAYOUTS
      end

      def self.find_category(slug)
        CATEGORIES[slug.to_sym]
      end

      def self.find_component(category_slug, component_slug)
        category = find_category(category_slug)
        return nil unless category

        category[:components].find { |c| c.slug == component_slug.to_s }
      end

      def self.all_components
        CATEGORIES.flat_map { |_key, cat| cat[:components] }
      end

      def self.component_count
        all_components.size
      end
    end
  end
end
