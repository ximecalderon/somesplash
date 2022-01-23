module CommentsHelper
    def show_errors(record, attribute)
    errors = record.errors.full_messages_for(attribute).map do |message|
      content_tag(:span, message)
    end

    p "==============================="
<<<<<<< HEAD
    p errors
=======
    p record.errors
>>>>>>> 847df26 (Error message)
    p "==============================="

    safe_join(errors)
  end
end
