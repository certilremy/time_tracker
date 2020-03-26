class UsersController < ApplicationController
  before_action :require_user, only: %i[show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(param_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to transactions_path
    else
      render 'new'
    end
  end

  private

  def param_user
    params.require(:user).permit(:username, :avatar)
  end
end
