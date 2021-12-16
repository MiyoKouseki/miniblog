class UsersController < ApplicationController
  before_action :current_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    if user_signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end    
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])   
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])    
  end
  

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_back_or @user
    else
      render 'new'
    end        
  end

  def update
    def update
      if @user.update(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end    
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  private
  # def set_user
  #   @user = User.find(params[:id])
  # end
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end        
end
