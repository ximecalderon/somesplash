module CommentsHelper
    def show_errors(record, attribute)
    errors = record.errors.full_messages_for(attribute).map do |message|
      content_tag(:span, message)
    end

    p "==============================="
    p errors
    p "==============================="

    safe_join(errors)
  end
end
