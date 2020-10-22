class UsersController < ApplicationController
  include AuthenticationHelper
  before_action :authenticate, only: [:destroy, :edit]
  before_action :set_user
  before_action :is_self?, only: [:destroy, :edit]

  def show
    @user_items = @user.questions
    @user_items = @user.answers if params[:tab] == 'answer'
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'هه‌ژماره‌که‌ت به‌ سه‌رکه‌وتووی ڕه‌شکراوه‌'
  end

  def update
    @user.update(username: params[:newUsername], old_username: @user.username)

    unless @user.errors.messages.empty?
      return render json: { success: false, message: @user.errors.messages[:username]}
    end

    render json: {success: true, url: user_show_url(username: @user.username)}
  end

  private
  def set_user
    @user = User.find_by_username params[:username]
    @user = User.find_by_old_username params[:username] if @user.nil?
  end

  def is_self?
    redirect_back fallback_location: root_path if current_user.id != @user.id
  end
end
