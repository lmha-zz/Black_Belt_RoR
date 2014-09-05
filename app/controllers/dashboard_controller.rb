class DashboardController < ApplicationController
  def index
    @friendship = Friendship.joins(:user).where("user_id = #{current_user.id}")
    @pendingFriends = Friendship.joins(:user).where("friend_id = #{current_user.id}")
  end
end
