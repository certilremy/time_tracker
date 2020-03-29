module UsersHelper
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
