class MicropostsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def favorited
    @users = Micropost.find(params[:id]).favouser.paginate(page: params[:page])
    render 'show_favorite'
  end
  
  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
  
end
