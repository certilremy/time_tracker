module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_user
    redirect_to root_path unless logged_in?
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = 'you do not have permission to peform this'
      redirect_to root_path
    end
  end
end
