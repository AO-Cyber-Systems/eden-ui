module EdenUi
  module ComponentHelper
    # ── Buttons ──────────────────────────────────────────────────────────

    def eden_button(variant: :primary, size: :md, outline: false, pill: false, type: :button, href: nil, disabled: false, **html_options, &block)
      render partial: "eden_ui/components/button", locals: {
        variant:, size:, outline:, pill:, type:, href:, disabled:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_button_to(name = nil, url = nil, variant: :primary, size: :md, outline: false, pill: false, disabled: false, **options, &block)
      options[:class] = eden_button_classes(variant: variant, size: size, outline: outline, pill: pill, disabled: disabled, extra: options[:class])
      if block
        button_to(name || url, **options, &block)
      else
        button_to(name, url, **options)
      end
    end

    def eden_button_group(**html_options, &block)
      render partial: "eden_ui/components/button_group", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_speed_dial(position: :bottom_right, trigger: :hover, **html_options, &block)
      render partial: "eden_ui/components/speed_dial", locals: {
        position:, trigger:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Navigation ───────────────────────────────────────────────────────

    def eden_navbar(fixed: true, transparent: false, **html_options, &block)
      render partial: "eden_ui/components/navbar", locals: {
        fixed:, transparent:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_sidebar(collapsed: false, position: :left, **html_options, &block)
      render partial: "eden_ui/components/sidebar", locals: {
        collapsed:, position:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_sidebar_item(label:, href: "#", icon: nil, badge: nil, active: false, **html_options)
      render partial: "eden_ui/components/sidebar_item", locals: {
        label:, href:, icon:, badge:, active:, html_options:
      }
    end

    def eden_sidebar_group(label:, icon: nil, open: false, **html_options, &block)
      render partial: "eden_ui/components/sidebar_group", locals: {
        label:, icon:, open:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_breadcrumb(**html_options, &block)
      render partial: "eden_ui/components/breadcrumb", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_breadcrumb_item(label:, href: nil, current: false, **html_options)
      render partial: "eden_ui/components/breadcrumb_item", locals: {
        label:, href:, current:, html_options:
      }
    end

    def eden_pagination(current_page:, total_pages:, path_proc: nil, **html_options)
      render partial: "eden_ui/components/pagination", locals: {
        current_page:, total_pages:, path_proc:, html_options:
      }
    end

    def eden_tabs(variant: :default, **html_options, &block)
      render partial: "eden_ui/components/tabs", locals: {
        variant:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_tab_item(label:, href: "#", active: false, disabled: false, **html_options)
      render partial: "eden_ui/components/tab_item", locals: {
        label:, href:, active:, disabled:, html_options:
      }
    end

    def eden_bottom_nav(variant: :default, **html_options, &block)
      render partial: "eden_ui/components/bottom_nav", locals: {
        variant:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_bottom_nav_item(label:, href: "#", icon: nil, active: false, **html_options)
      render partial: "eden_ui/components/bottom_nav_item", locals: {
        label:, href:, icon:, active:, html_options:
      }
    end

    def eden_mega_menu(label:, **html_options, &block)
      render partial: "eden_ui/components/mega_menu", locals: {
        label:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Data Display ─────────────────────────────────────────────────────

    def eden_table(striped: false, hoverable: false, **html_options, &block)
      render partial: "eden_ui/components/table", locals: {
        striped:, hoverable:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_table_head(**html_options, &block)
      render partial: "eden_ui/components/table_head", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_table_row(**html_options, &block)
      render partial: "eden_ui/components/table_row", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_badge(text: nil, variant: :default, size: :sm, pill: false, bordered: false, icon: nil, dismissible: false, href: nil, **html_options, &block)
      render partial: "eden_ui/components/badge", locals: {
        text:, variant:, size:, pill:, bordered:, icon:, dismissible:, href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_alert(variant: :info, dismissible: false, bordered: false, icon: nil, **html_options, &block)
      render partial: "eden_ui/components/alert", locals: {
        variant:, dismissible:, bordered:, icon:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_list_group(bordered: true, **html_options, &block)
      render partial: "eden_ui/components/list_group", locals: {
        bordered:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_list_group_item(label: nil, href: nil, active: false, disabled: false, icon: nil, **html_options, &block)
      render partial: "eden_ui/components/list_group_item", locals: {
        label:, href:, active:, disabled:, icon:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_timeline(horizontal: false, **html_options, &block)
      render partial: "eden_ui/components/timeline", locals: {
        horizontal:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_timeline_item(datetime: nil, title: nil, body: nil, **html_options, &block)
      render partial: "eden_ui/components/timeline_item", locals: {
        datetime:, title:, body:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Media & Identity ─────────────────────────────────────────────────

    def eden_avatar(src: nil, alt: "Avatar", size: :md, rounded: true, bordered: false, status: nil, initials: nil, **html_options)
      render partial: "eden_ui/components/avatar", locals: {
        src:, alt:, size:, rounded:, bordered:, status:, initials:, html_options:
      }
    end

    def eden_indicator(variant: :default, size: :md, position: :top_right, ping: false, **html_options, &block)
      render partial: "eden_ui/components/indicator", locals: {
        variant:, size:, position:, ping:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_kbd(text: nil, **html_options, &block)
      render partial: "eden_ui/components/kbd", locals: {
        text:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Containers ───────────────────────────────────────────────────────

    def eden_card(href: nil, horizontal: false, image: nil, image_alt: nil, **html_options, &block)
      render partial: "eden_ui/components/card", locals: {
        href:, horizontal:, image:, image_alt:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_accordion(flush: false, always_open: false, **html_options, &block)
      render partial: "eden_ui/components/accordion", locals: {
        flush:, always_open:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_accordion_item(title:, open: false, **html_options, &block)
      render partial: "eden_ui/components/accordion_item", locals: {
        title:, open:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_drawer(id:, position: :left, backdrop: true, **html_options, &block)
      render partial: "eden_ui/components/drawer", locals: {
        id:, position:, backdrop:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_banner(variant: :default, position: :top, dismissible: true, **html_options, &block)
      render partial: "eden_ui/components/banner", locals: {
        variant:, position:, dismissible:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_jumbotron(title: nil, subtitle: nil, **html_options, &block)
      render partial: "eden_ui/components/jumbotron", locals: {
        title:, subtitle:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Forms ────────────────────────────────────────────────────────────

    def eden_form_group(label: nil, hint: nil, error: nil, required: false, **html_options, &block)
      render partial: "eden_ui/components/form_group", locals: {
        label:, hint:, error:, required:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_label(text:, for_id: nil, required: false, **html_options)
      render partial: "eden_ui/components/label", locals: {
        text:, for_id:, required:, html_options:
      }
    end

    def eden_input(type: :text, size: :md, disabled: false, placeholder: nil, value: nil, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/input", locals: {
        type:, size:, disabled:, placeholder:, value:, id:, name:, html_options:
      }
    end

    def eden_textarea(rows: 4, placeholder: nil, disabled: false, id: nil, name: nil, value: nil, **html_options)
      render partial: "eden_ui/components/textarea", locals: {
        rows:, placeholder:, disabled:, id:, name:, value:, html_options:
      }
    end

    def eden_select(options: [], selected: nil, prompt: nil, placeholder: nil, disabled: false, multiple: false, size: :md, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/select", locals: {
        options:, selected:, prompt: prompt || placeholder, disabled:, multiple:, size:, id:, name:, html_options:
      }
    end

    def eden_checkbox(label: nil, checked: false, disabled: false, id: nil, name: nil, value: nil, **html_options)
      render partial: "eden_ui/components/checkbox", locals: {
        label:, checked:, disabled:, id:, name:, value:, html_options:
      }
    end

    def eden_radio(label: nil, checked: false, disabled: false, id: nil, name: nil, value: nil, **html_options)
      render partial: "eden_ui/components/radio", locals: {
        label:, checked:, disabled:, id:, name:, value:, html_options:
      }
    end

    def eden_toggle(label: nil, checked: false, disabled: false, size: :md, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/toggle", locals: {
        label:, checked:, disabled:, size:, id:, name:, html_options:
      }
    end

    def eden_file_input(label: nil, hint: nil, multiple: false, accept: nil, disabled: false, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/file_input", locals: {
        label:, hint:, multiple:, accept:, disabled:, id:, name:, html_options:
      }
    end

    def eden_dropzone(**html_options, &block)
      render partial: "eden_ui/components/dropzone", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_range(min: 0, max: 100, step: 1, value: 50, disabled: false, size: :md, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/range", locals: {
        min:, max:, step:, value:, disabled:, size:, id:, name:, html_options:
      }
    end

    def eden_floating_label(type: :text, label:, placeholder: " ", variant: :default, size: :md, disabled: false, id: nil, name: nil, **html_options)
      render partial: "eden_ui/components/floating_label", locals: {
        type:, label:, placeholder:, variant:, size:, disabled:, id:, name:, html_options:
      }
    end

    def eden_search_input(placeholder: "Search...", size: :md, id: nil, name: nil, value: nil, **html_options)
      render partial: "eden_ui/components/search_input", locals: {
        placeholder:, size:, id:, name:, value:, html_options:
      }
    end

    def eden_phone_input(placeholder: nil, country_code: "+1", id: nil, name: nil, value: nil, **html_options)
      render partial: "eden_ui/components/phone_input", locals: {
        placeholder:, country_code:, id:, name:, value:, html_options:
      }
    end

    def eden_timepicker(id: nil, name: nil, value: nil, min: nil, max: nil, step: nil, **html_options)
      render partial: "eden_ui/components/timepicker", locals: {
        id:, name:, value:, min:, max:, step:, html_options:
      }
    end

    def eden_helper_text(text: nil, variant: :default, **html_options, &block)
      render partial: "eden_ui/components/helper_text", locals: {
        text:, variant:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_error_text(text: nil, **html_options, &block)
      render partial: "eden_ui/components/error_text", locals: {
        text:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_input_group(**html_options, &block)
      render partial: "eden_ui/components/input_group", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Auth Forms ─────────────────────────────────────────────────────

    def eden_sign_in_form(url: "#", method: :post, heading: "Sign in to your account", form: nil, resource_name: nil, remember_me: true, forgot_password_url: nil, sign_up_url: nil, sign_up_text: "Don't have an account yet?", submit_text: "Sign in", social_buttons: nil, **html_options, &block)
      render partial: "eden_ui/components/sign_in_form", locals: {
        url:, method:, heading:, form:, resource_name:, remember_me:, forgot_password_url:, sign_up_url:, sign_up_text:, submit_text:, social_buttons:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_sign_up_form(url: "#", method: :post, heading: "Create an account", form: nil, name_field: true, confirm_password: true, password_hint: nil, terms_url: nil, sign_in_url: nil, sign_in_text: "Already have an account?", submit_text: "Create account", social_buttons: nil, **html_options, &block)
      render partial: "eden_ui/components/sign_up_form", locals: {
        url:, method:, heading:, form:, name_field:, confirm_password:, password_hint:, terms_url:, sign_in_url:, sign_in_text:, submit_text:, social_buttons:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_forgot_password_form(url: "#", method: :post, heading: "Forgot your password?", description: "No worries, we'll send you reset instructions.", form: nil, sign_in_url: nil, submit_text: "Send reset instructions", **html_options, &block)
      render partial: "eden_ui/components/forgot_password_form", locals: {
        url:, method:, heading:, description:, form:, sign_in_url:, submit_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_reset_password_form(url: "#", method: :put, heading: "Reset your password", form: nil, password_hint: nil, reset_token: nil, sign_in_url: nil, submit_text: "Reset password", **html_options, &block)
      render partial: "eden_ui/components/reset_password_form", locals: {
        url:, method:, heading:, form:, password_hint:, reset_token:, sign_in_url:, submit_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_edit_profile_form(url: "#", method: :put, heading: "Edit profile", form: nil, name_field: true, password_hint: nil, cancel_url: nil, delete_url: nil, delete_confirm: "Are you sure you want to delete your account? This cannot be undone.", submit_text: "Update profile", **html_options, &block)
      render partial: "eden_ui/components/edit_profile_form", locals: {
        url:, method:, heading:, form:, name_field:, password_hint:, cancel_url:, delete_url:, delete_confirm:, submit_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Overlays ─────────────────────────────────────────────────────────

    def eden_dropdown(label: nil, trigger: :click, placement: :bottom, **html_options, &block)
      render partial: "eden_ui/components/dropdown", locals: {
        label:, trigger:, placement:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_dropdown_item(label: nil, href: "#", icon: nil, **html_options, &block)
      render partial: "eden_ui/components/dropdown_item", locals: {
        label:, href:, icon:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_dropdown_divider(**html_options)
      render partial: "eden_ui/components/dropdown_divider", locals: {
        html_options:
      }
    end

    def eden_modal(id:, size: :md, dismissible: true, position: :center, **html_options, &block)
      render partial: "eden_ui/components/modal", locals: {
        id:, size:, dismissible:, position:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_tooltip(text:, placement: :top, trigger: :hover, **html_options, &block)
      render partial: "eden_ui/components/tooltip", locals: {
        text:, placement:, trigger:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_popover(title: nil, placement: :top, trigger: :hover, **html_options, &block)
      render partial: "eden_ui/components/popover", locals: {
        title:, placement:, trigger:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_toast(variant: :default, dismissible: true, icon: nil,
                   message: nil, position: :"top-right", auto_dismiss: nil,
                   **html_options, &block)
      render partial: "eden_ui/components/toast",
        locals: { variant:, dismissible:, icon:, message:, position:, auto_dismiss:,
                  html_options:, content: block ? capture(&block) : nil }
    end

    # ── Data Display (Extended) ────────────────────────────────────────

    def eden_stat_card(label:, value:, change: nil, trend: nil, icon: nil, variant: :default, **html_options, &block)
      render partial: "eden_ui/components/stat_card", locals: {
        label:, value:, change:, trend:, icon:, variant:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_code_block(code:, language: nil, line_numbers: false, copyable: true, **html_options)
      render partial: "eden_ui/components/code_block", locals: {
        code:, language:, line_numbers:, copyable:, html_options:
      }
    end

    def eden_description_list(variant: :horizontal, columns: 1, bordered: false, striped: false, **html_options, &block)
      render partial: "eden_ui/components/description_list", locals: {
        variant:, columns:, bordered:, striped:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_description_item(term:, detail: nil, vertical: false, **html_options, &block)
      render partial: "eden_ui/components/description_item", locals: {
        term:, detail:, vertical:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Utility ──────────────────────────────────────────────────────────

    def eden_empty_state(title: nil, description: nil, icon: nil, action_text: nil, action_href: nil, **html_options, &block)
      render partial: "eden_ui/components/empty_state", locals: {
        title:, description:, icon:, action_text:, action_href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_divider(text: nil, variant: :default, spacing: :md, icon: nil, **html_options)
      render partial: "eden_ui/components/divider", locals: {
        text:, variant:, spacing:, icon:, html_options:
      }
    end

    def eden_clipboard(target: nil, text: nil, **html_options, &block)
      render partial: "eden_ui/components/clipboard", locals: {
        target:, text:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_spinner(size: :md, variant: :primary, **html_options)
      render partial: "eden_ui/components/spinner", locals: {
        size:, variant:, html_options:
      }
    end

    def eden_skeleton(variant: :text, count: 1, **html_options)
      render partial: "eden_ui/components/skeleton", locals: {
        variant:, count:, html_options:
      }
    end

    def eden_progress(value: 0, size: :md, variant: :primary, label: nil, **html_options)
      render partial: "eden_ui/components/progress", locals: {
        value:, size:, variant:, label:, html_options:
      }
    end

    def eden_rating(value: 0, max: 5, size: :md, readonly: true, **html_options)
      render partial: "eden_ui/components/rating", locals: {
        value:, max:, size:, readonly:, html_options:
      }
    end

    def eden_stepper(**html_options, &block)
      render partial: "eden_ui/components/stepper", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_stepper_item(label:, description: nil, status: :upcoming, icon: nil, **html_options)
      render partial: "eden_ui/components/stepper_item", locals: {
        label:, description:, status:, icon:, html_options:
      }
    end

    # ── Forms (Extended) ────────────────────────────────────────────────

    def eden_tag_input(name: nil, id: nil, value: [], placeholder: "Add a tag...", max_tags: nil, delimiter: ",", disabled: false, **html_options)
      render partial: "eden_ui/components/tag_input", locals: {
        name:, id:, value:, placeholder:, max_tags:, delimiter:, disabled:, html_options:
      }
    end

    def eden_datepicker(name: nil, id: nil, value: nil, min: nil, max: nil, placeholder: "Select date", format: "%Y-%m-%d", disabled: false, **html_options)
      render partial: "eden_ui/components/datepicker", locals: {
        name:, id:, value:, min:, max:, placeholder:, format:, disabled:, html_options:
      }
    end

    # ── Rich Content ─────────────────────────────────────────────────────

    def eden_typing_indicator(sender: nil, avatar: nil, **html_options)
      render partial: "eden_ui/components/typing_indicator", locals: {
        sender:, avatar:, html_options:
      }
    end

    def eden_carousel(indicators: true, controls: true, slide: true, **html_options, &block)
      render partial: "eden_ui/components/carousel", locals: {
        indicators:, controls:, slide:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_gallery(columns: 3, gap: 4, **html_options, &block)
      render partial: "eden_ui/components/gallery", locals: {
        columns:, gap:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_device_mockup(device: :phone, color: :default, **html_options, &block)
      render partial: "eden_ui/components/device_mockup", locals: {
        device:, color:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_chat_bubble(message: nil, sender: nil, time: nil, delivered: false, avatar: nil, position: :left, **html_options, &block)
      render partial: "eden_ui/components/chat_bubble", locals: {
        message:, sender:, time:, delivered:, avatar:, position:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_footer(variant: :default, **html_options, &block)
      render partial: "eden_ui/components/footer", locals: {
        variant:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Page / Layout Components ──────────────────────────────────────

    def eden_page_header(title:, description: nil, breadcrumbs: [], **html_options, &block)
      render partial: "eden_ui/components/page_header", locals: {
        title:, description:, breadcrumbs:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_section_header(title:, subtitle: nil, action_text: nil, action_href: nil, **html_options, &block)
      render partial: "eden_ui/components/section_header", locals: {
        title:, subtitle:, action_text:, action_href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_toolbar(search_placeholder: "Search...", search_name: "search", search_value: nil, **html_options, &block)
      render partial: "eden_ui/components/toolbar", locals: {
        search_placeholder:, search_name:, search_value:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_chart_card(title:, subtitle: nil, value: nil, chart_id: nil, **html_options, &block)
      render partial: "eden_ui/components/chart_card", locals: {
        title:, subtitle:, value:, chart_id:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Charts (ApexCharts) ─────────────────────────────────────────

    def eden_line_chart(id:, labels:, datasets:, height: 350, colors: [], **options)
      render partial: "eden_ui/components/line_chart", locals: {
        id:, labels:, datasets:, height:, colors:, **options
      }
    end

    def eden_bar_chart(id:, labels:, datasets:, stacked: false, horizontal: false, height: 350, colors: [], **options)
      render partial: "eden_ui/components/bar_chart", locals: {
        id:, labels:, datasets:, stacked:, horizontal:, height:, colors:, **options
      }
    end

    def eden_doughnut_chart(id:, labels:, data:, colors: [], height: 300, **options)
      render partial: "eden_ui/components/doughnut_chart", locals: {
        id:, labels:, data:, colors:, height:, **options
      }
    end

    def eden_mini_chart(id:, data:, color: nil, height: 40, width: 120, **options)
      render partial: "eden_ui/components/mini_chart", locals: {
        id:, data:, color:, height:, width:, **options
      }
    end

    def eden_activity_timeline(items: [], **html_options, &block)
      render partial: "eden_ui/components/activity_timeline", locals: {
        items:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_data_table(columns: [], rows: [], striped: false, hoverable: true, selectable: false, **html_options, &block)
      render partial: "eden_ui/components/data_table", locals: {
        columns:, rows:, striped:, hoverable:, selectable:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_table_toolbar(title: nil, count: nil, search_placeholder: "Search...", search_name: "q", **html_options, &block)
      render partial: "eden_ui/components/table_toolbar", locals: {
        title:, count:, search_placeholder:, search_name:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_filter_dropdown(label: "Filter", icon: nil, open: false, **html_options, &block)
      render partial: "eden_ui/components/filter_dropdown", locals: {
        label:, icon:, open:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_crud_modal(id:, title:, size: :md, submit_text: "Save", cancel_text: "Cancel", form_url: "#", form_method: :post, **html_options, &block)
      render partial: "eden_ui/components/crud_modal", locals: {
        id:, title:, size:, submit_text:, cancel_text:, form_url:, form_method:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_delete_confirm(id:, title: "Confirm Deletion", message: "Are you sure? This action cannot be undone.", confirm_text: "Delete", cancel_text: "Cancel", form_url: "#", form_method: :delete, **html_options)
      render partial: "eden_ui/components/delete_confirm", locals: {
        id:, title:, message:, confirm_text:, cancel_text:, form_url:, form_method:,
        html_options:
      }
    end

    def eden_bulk_action_bar(count: 0, visible: false, **html_options, &block)
      render partial: "eden_ui/components/bulk_action_bar", locals: {
        count:, visible:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── User & Profile ──────────────────────────────────────────────────

    def eden_profile_header(name:, role: nil, email: nil, location: nil, avatar_src: nil, avatar_initials: nil, stats: [], cover_color: :primary, **html_options, &block)
      render partial: "eden_ui/components/profile_header", locals: {
        name:, role:, email:, location:, avatar_src:, avatar_initials:, stats:, cover_color:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_user_card(name:, email: nil, role: nil, status: nil, avatar_src: nil, avatar_initials: nil, **html_options, &block)
      render partial: "eden_ui/components/user_card", locals: {
        name:, email:, role:, status:, avatar_src:, avatar_initials:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_avatar_upload(src: nil, initials: nil, name: "avatar", id: "avatar-upload", accept: "image/*", **html_options)
      render partial: "eden_ui/components/avatar_upload", locals: {
        src:, initials:, name:, id:, accept:, html_options:
      }
    end

    # ── Settings ────────────────────────────────────────────────────────

    def eden_settings_section(title:, description: nil, collapsible: false, **html_options, &block)
      render partial: "eden_ui/components/settings_section", locals: {
        title:, description:, collapsible:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Mailing ─────────────────────────────────────────────────────────

    def eden_inbox_toolbar(selected_count: 0, **html_options, &block)
      render partial: "eden_ui/components/inbox_toolbar", locals: {
        selected_count:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_inbox_item(sender:, subject:, preview: nil, time: nil, unread: false, selected: false, starred: false, avatar_src: nil, avatar_initials: nil, **html_options, &block)
      render partial: "eden_ui/components/inbox_item", locals: {
        sender:, subject:, preview:, time:, unread:, selected:, starred:, avatar_src:, avatar_initials:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_message_view(sender:, sender_email: nil, recipient: nil, subject: nil, time: nil, avatar_src: nil, avatar_initials: nil, **html_options, &block)
      render partial: "eden_ui/components/message_view", locals: {
        sender:, sender_email:, recipient:, subject:, time:, avatar_src:, avatar_initials:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Notifications ───────────────────────────────────────────────────

    def eden_notification_item(title:, body: nil, time: nil, icon: nil, read: false, href: nil, variant: :default, **html_options)
      render partial: "eden_ui/components/notification_item", locals: {
        title:, body:, time:, icon:, read:, href:, variant:, html_options:
      }
    end

    def eden_notification_list(title: "Notifications", notifications: [], mark_all_url: nil, view_all_url: nil, **html_options, &block)
      render partial: "eden_ui/components/notification_list", locals: {
        title:, notifications:, mark_all_url:, view_all_url:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Project Management ───────────────────────────────────────────

    def eden_kanban_board(**html_options, &block)
      render partial: "eden_ui/components/kanban_board", locals: {
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_kanban_column(title:, count: nil, color: :default, **html_options, &block)
      render partial: "eden_ui/components/kanban_column", locals: {
        title:, count:, color:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_kanban_card(title:, description: nil, priority: nil, due_date: nil, assignees: [], tags: [], **html_options, &block)
      render partial: "eden_ui/components/kanban_card", locals: {
        title:, description:, priority:, due_date:, assignees:, tags:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_task_list(title: nil, tasks: [], **html_options, &block)
      render partial: "eden_ui/components/task_list", locals: {
        title:, tasks:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_task_item(title:, completed: false, priority: :medium, assignee: nil, due_date: nil, **html_options, &block)
      render partial: "eden_ui/components/task_item", locals: {
        title:, completed:, priority:, assignee:, due_date:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_project_card(title:, description: nil, status: :active, progress: 0, team: [], due_date: nil, **html_options, &block)
      render partial: "eden_ui/components/project_card", locals: {
        title:, description:, status:, progress:, team:, due_date:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Calendar & Events ────────────────────────────────────────────

    def eden_calendar(month: Date.current.month, year: Date.current.year, events: [], start_day: :sunday, **html_options)
      render partial: "eden_ui/components/calendar", locals: {
        month:, year:, events:, start_day:, html_options:
      }
    end

    def eden_event_card(title:, start_time: nil, end_time: nil, location: nil, color: :primary, description: nil, **html_options, &block)
      render partial: "eden_ui/components/event_card", locals: {
        title:, start_time:, end_time:, location:, color:, description:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_event_list(events: [], grouped: true, **html_options)
      render partial: "eden_ui/components/event_list", locals: {
        events:, grouped:, html_options:
      }
    end

    # ── E-Commerce ─────────────────────────────────────────────────────

    def eden_invoice(invoice_number: nil, date: nil, due_date: nil, from: {}, to: {}, items: [], subtotal: nil, tax: nil, shipping: nil, discount: nil, total: nil, status: :pending, notes: nil, **html_options, &block)
      render partial: "eden_ui/components/invoice", locals: {
        invoice_number:, date:, due_date:, from:, to:, items:, subtotal:, tax:, shipping:, discount:, total:, status:, notes:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_invoice_item(description: nil, quantity: 1, unit_price: nil, total: nil, **html_options)
      render partial: "eden_ui/components/invoice_item", locals: {
        description:, quantity:, unit_price:, total:, html_options:
      }
    end

    def eden_plan_card(name: nil, price: nil, period: "/month", description: nil, features: [], current: false, cta_text: "Upgrade", cta_href: "#", popular: false, **html_options, &block)
      render partial: "eden_ui/components/plan_card", locals: {
        name:, price:, period:, description:, features:, current:, cta_text:, cta_href:, popular:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_transaction_item(id: nil, description: nil, amount: nil, type: :credit, status: :completed, date: nil, party: nil, **html_options, &block)
      render partial: "eden_ui/components/transaction_item", locals: {
        id:, description:, amount:, type:, status:, date:, party:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_product_card(title: nil, price: nil, image: nil, category: nil, rating: nil, reviews_count: nil, badge_text: nil, badge_variant: nil, href: nil, **html_options, &block)
      render partial: "eden_ui/components/product_card", locals: {
        title:, price:, image:, category:, rating:, reviews_count:, badge_text:, badge_variant:, href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_order_summary(subtotal: nil, tax: nil, shipping: nil, discount: nil, total: nil, **html_options, &block)
      render partial: "eden_ui/components/order_summary", locals: {
        subtotal:, tax:, shipping:, discount:, total:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Status & Monitoring ────────────────────────────────────────────

    def eden_service_status(name: nil, status: :operational, uptime: nil, response_time: nil, last_incident: nil, **html_options, &block)
      render partial: "eden_ui/components/service_status", locals: {
        name:, status:, uptime:, response_time:, last_incident:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_incident_timeline(incidents: [], **html_options, &block)
      render partial: "eden_ui/components/incident_timeline", locals: {
        incidents:, html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_status_banner(status: :operational, message: nil, href: nil, **html_options, &block)
      render partial: "eden_ui/components/status_banner", locals: {
        status:, message:, href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── File Management ────────────────────────────────────────────────

    def eden_file_card(name: nil, size: nil, type: nil, modified: nil, icon: nil, href: nil, **html_options, &block)
      render partial: "eden_ui/components/file_card", locals: {
        name:, size:, type:, modified:, icon:, href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_file_list(files: [], **html_options, &block)
      render partial: "eden_ui/components/file_list", locals: {
        files:, html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Support & Tickets ──────────────────────────────────────────────

    def eden_ticket_item(id: nil, subject: nil, requester: nil, status: :open, priority: :medium, assignee: nil, created_at: nil, href: nil, **html_options, &block)
      render partial: "eden_ui/components/ticket_item", locals: {
        id:, subject:, requester:, status:, priority:, assignee:, created_at:, href:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_ticket_detail(id: nil, subject: nil, status: :open, priority: :medium, requester: {}, assignee: nil, created_at: nil, messages: [], **html_options, &block)
      render partial: "eden_ui/components/ticket_detail", locals: {
        id:, subject:, status:, priority:, requester:, assignee:, created_at:, messages:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Marketing Sections ─────────────────────────────────────────────

    def eden_hero_section(title:, subtitle: nil, primary_cta_text: nil, primary_cta_href: "#", secondary_cta_text: nil, secondary_cta_href: "#", image: nil, image_alt: nil, variant: :centered, badge_text: nil, **html_options, &block)
      render partial: "eden_ui/components/hero_section", locals: {
        title:, subtitle:, primary_cta_text:, primary_cta_href:, secondary_cta_text:, secondary_cta_href:, image:, image_alt:, variant:, badge_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_feature_section(title:, subtitle: nil, features: [], columns: 3, variant: :grid, **html_options, &block)
      render partial: "eden_ui/components/feature_section", locals: {
        title:, subtitle:, features:, columns:, variant:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_customer_logos(title: "Trusted by", logos: [], **html_options, &block)
      render partial: "eden_ui/components/customer_logos", locals: {
        title:, logos:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_cta_section(title:, subtitle: nil, primary_cta_text: nil, primary_cta_href: "#", secondary_cta_text: nil, secondary_cta_href: "#", variant: :centered, **html_options, &block)
      render partial: "eden_ui/components/cta_section", locals: {
        title:, subtitle:, primary_cta_text:, primary_cta_href:, secondary_cta_text:, secondary_cta_href:, variant:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_pricing_section(title: "Pricing", subtitle: nil, plans: [], billing_toggle: false, **html_options, &block)
      render partial: "eden_ui/components/pricing_section", locals: {
        title:, subtitle:, plans:, billing_toggle:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_team_section(title: "Our Team", subtitle: nil, members: [], columns: 4, **html_options, &block)
      render partial: "eden_ui/components/team_section", locals: {
        title:, subtitle:, members:, columns:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_testimonial_section(title: "Testimonials", subtitle: nil, testimonials: [], variant: :grid, **html_options, &block)
      render partial: "eden_ui/components/testimonial_section", locals: {
        title:, subtitle:, testimonials:, variant:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_contact_section(title: "Contact Us", subtitle: nil, form_url: "#", form_method: :post, show_info: true, email: nil, phone: nil, address: nil, **html_options, &block)
      render partial: "eden_ui/components/contact_section", locals: {
        title:, subtitle:, form_url:, form_method:, show_info:, email:, phone:, address:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_blog_section(title: "Latest Articles", subtitle: nil, posts: [], columns: 3, **html_options, &block)
      render partial: "eden_ui/components/blog_section", locals: {
        title:, subtitle:, posts:, columns:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_faq_section(title: "FAQ", subtitle: nil, questions: [], columns: 1, **html_options, &block)
      render partial: "eden_ui/components/faq_section", locals: {
        title:, subtitle:, questions:, columns:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_stats_section(title: nil, subtitle: nil, stats: [], variant: :default, **html_options, &block)
      render partial: "eden_ui/components/stats_section", locals: {
        title:, subtitle:, stats:, variant:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    def eden_content_section(title:, subtitle: nil, body: nil, image: nil, image_alt: nil, image_position: :right, features: [], **html_options, &block)
      render partial: "eden_ui/components/content_section", locals: {
        title:, subtitle:, body:, image:, image_alt:, image_position:, features:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Rich Editor ──────────────────────────────────────────────────────

    def eden_rich_editor(id: "editor", name: "content", value: nil, placeholder: "Write something...", toolbar: [:bold, :italic, :underline, :link, :list_ul, :list_ol, :quote, :code, :image], **html_options, &block)
      render partial: "eden_ui/components/rich_editor", locals: {
        id:, name:, value:, placeholder:, toolbar:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Integration Card ────────────────────────────────────────────────

    def eden_integration_card(name:, description: nil, icon_src: nil, icon_svg: nil, connected: false, enabled: true, href: nil, category: nil, **html_options, &block)
      render partial: "eden_ui/components/integration_card", locals: {
        name:, description:, icon_src:, icon_svg:, connected:, enabled:, href:, category:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── API Endpoint ────────────────────────────────────────────────────

    def eden_api_endpoint(method: :get, path: "/", description: nil, params: [], response_example: nil, auth_required: true, **html_options, &block)
      render partial: "eden_ui/components/api_endpoint", locals: {
        method:, path:, description:, params:, response_example:, auth_required:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Two Factor Form ─────────────────────────────────────────────────

    def eden_two_factor_form(url: "#", method: :post, heading: "Two-factor authentication", description: "Enter the code from your authenticator app.", code_length: 6, resend_url: nil, back_url: nil, submit_text: "Verify", **html_options, &block)
      render partial: "eden_ui/components/two_factor_form", locals: {
        url:, method:, heading:, description:, code_length:, resend_url:, back_url:, submit_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Error Page ──────────────────────────────────────────────────────

    def eden_error_page(code: "404", title: "Page not found", description: "Sorry, we can't find that page.", back_href: "/", back_text: "Go back home", support_href: nil, support_text: "Contact support", **html_options, &block)
      render partial: "eden_ui/components/error_page", locals: {
        code:, title:, description:, back_href:, back_text:, support_href:, support_text:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    # ── Maintenance Page ────────────────────────────────────────────────

    def eden_maintenance_page(title: "Under Maintenance", description: "We're working on improvements. We'll be back shortly.", estimated_time: nil, notify_url: nil, notify_placeholder: "Enter your email", **html_options, &block)
      render partial: "eden_ui/components/maintenance_page", locals: {
        title:, description:, estimated_time:, notify_url:, notify_placeholder:,
        html_options:, content: block ? capture(&block) : nil
      }
    end

    private

    def eden_button_classes(variant: :primary, size: :md, outline: false, pill: false, disabled: false, extra: nil)
      base = "inline-flex items-center justify-center font-medium focus:ring-4 focus:outline-none transition-colors"

      size_cls = case size.to_sym
      when :xs then "px-3 py-2 text-xs"
      when :sm then "px-3 py-2 text-sm"
      when :lg then "px-5 py-3 text-base"
      when :xl then "px-6 py-3.5 text-base"
      else "px-5 py-2.5 text-sm"
      end

      variant_cls = if outline
        case variant.to_sym
        when :secondary then "text-zinc-900 border border-zinc-300 hover:bg-zinc-100 focus:ring-zinc-200 dark:text-white dark:border-zinc-600 dark:hover:bg-zinc-700 dark:focus:ring-zinc-700"
        when :danger    then "text-red-700 border border-red-700 hover:bg-red-800 hover:text-white focus:ring-red-300 dark:text-red-500 dark:border-red-500 dark:hover:bg-red-600 dark:hover:text-white dark:focus:ring-red-900"
        when :success   then "text-green-700 border border-green-700 hover:bg-green-800 hover:text-white focus:ring-green-300 dark:text-green-500 dark:border-green-500 dark:hover:bg-green-600 dark:hover:text-white dark:focus:ring-green-800"
        when :warning   then "text-yellow-400 border border-yellow-400 hover:bg-yellow-500 hover:text-white focus:ring-yellow-300 dark:text-yellow-300 dark:border-yellow-300 dark:hover:bg-yellow-400 dark:hover:text-white dark:focus:ring-yellow-900"
        else "text-primary-700 border border-primary-700 hover:bg-primary-800 hover:text-white focus:ring-primary-300 dark:text-primary-500 dark:border-primary-500 dark:hover:bg-primary-600 dark:hover:text-white dark:focus:ring-primary-800"
        end
      else
        case variant.to_sym
        when :secondary then "text-zinc-900 bg-white border border-zinc-300 hover:bg-zinc-100 focus:ring-zinc-200 dark:bg-zinc-800 dark:text-white dark:border-zinc-600 dark:hover:bg-zinc-700 dark:focus:ring-zinc-700"
        when :danger    then "text-white bg-red-700 hover:bg-red-800 focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
        when :success   then "text-white bg-green-700 hover:bg-green-800 focus:ring-green-300 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800"
        when :warning   then "text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-yellow-300 dark:focus:ring-yellow-900"
        when :purple    then "text-white bg-purple-700 hover:bg-purple-800 focus:ring-purple-300 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900"
        else "text-white bg-primary-600 hover:bg-primary-700 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
        end
      end

      disabled_cls = disabled ? "opacity-50 cursor-not-allowed" : "cursor-pointer"
      rounded = pill ? "rounded-full" : "rounded-lg"
      [base, size_cls, variant_cls, rounded, disabled_cls, extra].compact_blank.join(" ")
    end
  end
end
