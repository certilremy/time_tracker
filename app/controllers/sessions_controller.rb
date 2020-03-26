class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:user_id] = @user.id
      redirect_to transactions_path
    else
      flash[:danger] = 'username not found'
      render 'new'
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
