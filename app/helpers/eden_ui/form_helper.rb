module EdenUi
  module FormHelper
    def eden_form_for(record, **options, &block)
      options[:builder] = EdenUi::FormBuilder
      options[:html] ||= {}
      options[:html][:class] = token_list("space-y-4", options[:html][:class])

      form_for(record, **options, &block)
    end

    def eden_form_with(**options, &block)
      options[:builder] = EdenUi::FormBuilder
      options[:html] ||= {}
      options[:html][:class] = token_list("space-y-4", options[:html][:class])

      form_with(**options, &block)
    end
  end
end
