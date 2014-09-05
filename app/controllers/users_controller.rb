class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = User.joins("LEFT JOIN friendships ON users.id = friendships.user_id").group("id").where("users.id != #{current_user.id}").where("NOT EXISTS (SELECT NULL FROM friendships WHERE friendships.user_id = users.id AND user_id = #{current_user.id})")
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
