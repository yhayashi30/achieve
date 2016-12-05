class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def detail
    @user = User.find(params[:id])
    @followed_users = @user.followed_users
    @followers = @user.followers
  end
end
