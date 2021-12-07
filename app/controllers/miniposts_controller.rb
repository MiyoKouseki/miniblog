class MinipostsController < ApplicationController
  before_action :set_minipost, only: [:show, :edit, :update, :destroy]

  # GET /miniposts
  # GET /miniposts.json
  def index
    @miniposts = Minipost.all
  end

  # GET /miniposts/1
  # GET /miniposts/1.json
  def show
  end

  # GET /miniposts/new
  def new
    @minipost = Minipost.new
  end

  # GET /miniposts/1/edit
  def edit
  end

  # POST /miniposts
  # POST /miniposts.json
  def create
    @minipost = Minipost.new(minipost_params)

    respond_to do |format|
      if @minipost.save
        format.html { redirect_to @minipost, notice: 'Minipost was successfully created.' }
        format.json { render :show, status: :created, location: @minipost }
      else
        format.html { render :new }
        format.json { render json: @minipost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miniposts/1
  # PATCH/PUT /miniposts/1.json
  def update
    respond_to do |format|
      if @minipost.update(minipost_params)
        format.html { redirect_to @minipost, notice: 'Minipost was successfully updated.' }
        format.json { render :show, status: :ok, location: @minipost }
      else
        format.html { render :edit }
        format.json { render json: @minipost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miniposts/1
  # DELETE /miniposts/1.json
  def destroy
    @minipost.destroy
    respond_to do |format|
      format.html { redirect_to miniposts_url, notice: 'Minipost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minipost
      @minipost = Minipost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minipost_params
      params.require(:minipost).permit(:content, :datetime, :user_id)
    end
end
