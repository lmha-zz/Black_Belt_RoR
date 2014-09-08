class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    friends = current_user.friend_ids
    if friends.empty?
      @users = User.where.not("id = #{current_user.id}")
    else
      @users = User.where.not("id IN (?) OR id = ?", friends, current_user.id)
    end
  end

  def show
  end

  def update
    @user = current_user
    if !@user.update(description_params)
      flash[:error] = "There was a problem updating your profile description, please try again later."
    end
    redirect_to dashboard_index_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def description_params
    params.require(:user).permit(:description)
  end
end
