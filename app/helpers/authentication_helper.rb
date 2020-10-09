module AuthenticationHelper
  def authenticate
    redirect_to new_user_session_path, notice: 'تکایه‌ داخڵبه‌ بۆ ئه‌وه‌ی پرسیارێک بکه‌یت' unless current_user
  end
end
