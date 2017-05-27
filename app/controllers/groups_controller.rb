class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def join
    @group = Group.find(params[:id])
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = "Join succeed!"
    else
      flash[:warning] = "You are the member of the group."
    end
    redirect_to group_path(@group)
  end

  def quit
    @group = Group.find(params[:id])
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash[:notice] = "Quit complete."
    else
      flash[:warning] = "You are not the member of this group."
    end
    redirect_to group_path(@group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      current_user.join!(@group)
      redirect_to @group
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @group.update(group_params)
      redirect_to @group, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy

    @group.destroy
    flash[:alert] = "Group deleted"
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_and_check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path, alert: "You have no permission."
    end
  end
end
