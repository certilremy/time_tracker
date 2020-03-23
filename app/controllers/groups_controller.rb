class GroupsController < ApplicationController
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

  private

  def params_group
    params.require(:group).permit(:name, :user_id)
  end
end
