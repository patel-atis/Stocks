class RelationshipsController < ApplicationController
  before_action :check_login

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).follower
    current_user.unfollow(user)
    redirect_to user
  end

  private

  def check_login
    unless logged_in?
      flash[:danger] = "You have to log in"
      redirect_to login_path
    end
  end

end
