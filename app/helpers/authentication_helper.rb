module AuthenticationHelper
  def authenticate
    redirect_to new_user_session_path, notice: 'تکایه‌ داخڵبه‌ بۆ ئه‌وه‌ی پرسیارێک بکه‌یت' unless current_user
  end

  def authenticate_json
    unless current_user
      render json: {
          message: 'ده‌بێت داخڵ بیت بۆ ئه‌وه‌ی بتوانی ده‌نگ بده‌یت'
      }
    end
  end
end
