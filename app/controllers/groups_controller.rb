class GroupsController < ApplicationController
  before_action :require_user
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_group)
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
