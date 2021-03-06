class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @microposts = @user.microposts.paginate(page: params[:page])   
  end

  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private  
  def set_user
    @user = User.find(params[:id])
  end
    
end
