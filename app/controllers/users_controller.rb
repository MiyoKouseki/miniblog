class UsersController < ApplicationController
  before_action :current_user, only: [:index, :edit, :update]
  #before_action :correct_user, only: [:edit, :update]
  #before_action :set_user, only: [:edit, :update]

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
    
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
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
    
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_url) unless current_user?(@user)
    # end

    # def current_user?(user)
    #   user && user == current_user
    # end

    
end
