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


  def fans
    @title = "Fans"
    @fans = Micropost.find(params[:id]).fans.paginate(page: params[:page])
    render 'show_fans'
  end
  
  
  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
  
end
