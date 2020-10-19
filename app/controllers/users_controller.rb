class UsersController < ApplicationController

  def show
    @user = User.find_by_username params[:username]
    @user_items = @user.questions

    @user_items = @user.answers if params[:tab] == 'answer'
  end
end
