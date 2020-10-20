class UsersController < ApplicationController
  include AuthenticationHelper
  before_action :authenticate, only: [:destroy, :edit]
  before_action :set_user
  before_action :is_self?, only: [:destroy, :edit]



  def show
    @user = User.find_by_username params[:username]
    @user_items = @user.questions

    @user_items = @user.answers if params[:tab] == 'answer'
  end

  def edit

  end

  def destroy
    @user.destroy

    redirect_to root_path, notice: 'هه‌ژماره‌که‌ت به‌ سه‌رکه‌وتووی ڕه‌شکراوه‌'
  end

  private
  def set_user
    @user = User.find_by_username params[:username]
  end

  def is_self?
    redirect_back fallback_location: root_path if current_user.id != @user.id
  end
end
