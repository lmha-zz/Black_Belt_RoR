class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added Friend."
    else
      flash[:error] = "Unable to add friend."
    end
    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id])
    @friendship.destroy_all
    flash[:notice] = "Removed friendship."
    redirect_to dashboard_index_path
  end
end
