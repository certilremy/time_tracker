class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(param_user)
    if @user.save

      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def param_user
    params.require(:user).permit(:username)
  end
end
