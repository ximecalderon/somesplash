module CategoriesHelper
    def show_errors(record, attribute)
      errors = record.errors.full_messages_for(attribute).map do |message|
        content_tag(:span, message,class: "input__error-message") #class: "input__error-message"
      end
      puts '*'*50
      p record.errors.full_messages
      puts '*'*50
      safe_join(errors)
    end
end
