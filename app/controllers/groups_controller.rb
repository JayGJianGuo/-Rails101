class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save

    redirect_to @groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def updata
    @group = Group.find(params[:id])
    @group.updata(group_params)

    redirect_to @group, notice: "Update Success"
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
