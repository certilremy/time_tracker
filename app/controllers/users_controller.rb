class UsersController < ApplicationController
  before_action :require_user, only: %i[show]
  before_action :set_user, only: %i[show]
  before_action :require_same_user, only: %i[show]
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

  def show; end

  private

  def param_user
    params.require(:user).permit(:username, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = 'you do not have permission to peform this'
      redirect_to root_path
    end
  end
end
