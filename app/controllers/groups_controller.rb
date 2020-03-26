class GroupsController < ApplicationController
  before_action :require_user
  def index
    @groups = Group.all.order(created_at: :desc).paginate(page: params[:page], per_page: 3)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_group)
    @group.user_id = current_user.id
    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private

  def params_group
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
