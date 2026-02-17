module EdenUi
  class FormBuilder < ActionView::Helpers::FormBuilder
    def eden_text_field(method, **options)
      eden_field(method, :text_field, **options)
    end

    def eden_email_field(method, **options)
      eden_field(method, :email_field, **options)
    end

    def eden_password_field(method, **options)
      eden_field(method, :password_field, **options)
    end

    def eden_number_field(method, **options)
      eden_field(method, :number_field, **options)
    end

    def eden_url_field(method, **options)
      eden_field(method, :url_field, **options)
    end

    def eden_phone_field(method, **options)
      eden_field(method, :phone_field, **options)
    end

    def eden_text_area(method, **options)
      eden_field(method, :text_area, **options)
    end

    def eden_select(method, choices = nil, select_options = {}, **html_options, &block)
      label_text = html_options.delete(:label) || method.to_s.humanize
      hint = html_options.delete(:hint)
      wrapper_class = html_options.delete(:wrapper_class) || "mb-4"

      html_options[:class] = eden_select_classes(html_options[:class])

      @template.content_tag(:div, class: wrapper_class) do
        parts = []
        parts << @template.render(partial: "eden_ui/components/label", locals: { text: label_text, for_id: eden_field_id(method) })
        parts << select(method, choices, select_options, **html_options, &block)
        parts << eden_hint(hint) if hint
        parts << eden_errors(method)
        @template.safe_join(parts)
      end
    end

    def eden_check_box(method, **options)
      label_text = options.delete(:label) || method.to_s.humanize
      wrapper_class = options.delete(:wrapper_class) || "mb-4"

      options[:class] = @template.token_list(
        "w-4 h-4 text-primary-600 bg-gray-100 border-gray-300 rounded focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600",
        options[:class]
      )

      @template.content_tag(:div, class: "flex items-center #{wrapper_class}") do
        parts = []
        parts << check_box(method, options)
        parts << @template.content_tag(:label, label_text,
          for: eden_field_id(method),
          class: "ms-2 text-sm font-medium text-gray-900 dark:text-gray-300")
        @template.safe_join(parts)
      end
    end

    def eden_toggle(method, **options)
      label_text = options.delete(:label) || method.to_s.humanize
      wrapper_class = options.delete(:wrapper_class) || "mb-4"

      @template.content_tag(:label, class: "relative inline-flex items-center cursor-pointer #{wrapper_class}") do
        parts = []
        parts << check_box(method, options.merge(class: "sr-only peer"))
        parts << @template.content_tag(:div, "", class: "w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-primary-300 dark:peer-focus:ring-primary-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-primary-600")
        parts << @template.content_tag(:span, label_text, class: "ms-3 text-sm font-medium text-gray-900 dark:text-gray-300")
        @template.safe_join(parts)
      end
    end

    def eden_file_field(method, **options)
      label_text = options.delete(:label) || method.to_s.humanize
      hint = options.delete(:hint)
      wrapper_class = options.delete(:wrapper_class) || "mb-4"

      options[:class] = @template.token_list(
        "block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400",
        options[:class]
      )

      @template.content_tag(:div, class: wrapper_class) do
        parts = []
        parts << @template.render(partial: "eden_ui/components/label", locals: { text: label_text, for_id: eden_field_id(method) })
        parts << file_field(method, options)
        parts << eden_hint(hint) if hint
        @template.safe_join(parts)
      end
    end

    def eden_submit(text = nil, **options)
      text ||= submit_default_value
      options[:class] = @template.token_list(
        "w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800",
        options[:class]
      )
      submit(text, options)
    end

    private

    def eden_field(method, field_type, **options)
      label_text = options.delete(:label) || method.to_s.humanize
      hint = options.delete(:hint)
      icon = options.delete(:icon)
      wrapper_class = options.delete(:wrapper_class) || "mb-4"
      size = options.delete(:size) || :md

      has_error = @object&.errors&.[](method)&.any?
      options[:class] = eden_input_classes(size, has_error, options[:class])

      @template.content_tag(:div, class: wrapper_class) do
        parts = []
        parts << @template.render(partial: "eden_ui/components/label", locals: { text: label_text, for_id: eden_field_id(method) })
        parts << send(field_type, method, options)
        parts << eden_hint(hint) if hint
        parts << eden_errors(method)
        @template.safe_join(parts)
      end
    end

    def eden_input_classes(size, has_error, extra_classes)
      base = "block w-full border rounded-lg focus:ring-primary-500 focus:border-primary-500 dark:focus:ring-primary-500 dark:focus:border-primary-500"
      size_classes = case size
      when :sm then "p-2 text-xs"
      when :lg then "p-4 text-base"
      else "p-2.5 text-sm"
      end
      color = if has_error
        "bg-red-50 border-red-500 text-red-900 placeholder-red-700 dark:bg-gray-700 dark:border-red-500 dark:text-red-500 dark:placeholder-red-500"
      else
        "bg-gray-50 border-gray-300 text-gray-900 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
      end
      @template.token_list(base, size_classes, color, extra_classes)
    end

    def eden_select_classes(extra_classes)
      @template.token_list(
        "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500",
        extra_classes
      )
    end

    def eden_field_id(method)
      "#{@object_name}_#{method}"
    end

    def eden_hint(text)
      @template.content_tag(:p, text, class: "mt-1 text-xs text-gray-500 dark:text-gray-400")
    end

    def eden_errors(method)
      return "".html_safe unless @object&.errors&.[](method)&.any?
      @template.content_tag(:p, @object.errors[method].first,
        class: "mt-1 text-xs text-red-600 dark:text-red-500")
    end
  end
end
