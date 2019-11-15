class CoverImgsController < ApplicationController
  before_action :set_cover_img, only: [:show, :edit, :update, :destroy]

  # GET /cover_imgs
  # GET /cover_imgs.json
  def index
    @cover_imgs = CoverImg.all
  end

  # GET /cover_imgs/1
  # GET /cover_imgs/1.json
  def show
  end

  # GET /cover_imgs/new
  def new
    @cover_img = CoverImg.new
  end

  # GET /cover_imgs/1/edit
  def edit
  end

  # POST /cover_imgs
  # POST /cover_imgs.json
  def create
    @cover_img = CoverImg.new(cover_img_params)

    respond_to do |format|
      if @cover_img.save
        format.html { redirect_to @cover_img, notice: 'Cover img was successfully created.' }
        format.json { render :show, status: :created, location: @cover_img }
      else
        format.html { render :new }
        format.json { render json: @cover_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cover_imgs/1
  # PATCH/PUT /cover_imgs/1.json
  def update
    respond_to do |format|
      if @cover_img.update(cover_img_params)
        format.html { redirect_to @cover_img, notice: 'Cover img was successfully updated.' }
        format.json { render :show, status: :ok, location: @cover_img }
      else
        format.html { render :edit }
        format.json { render json: @cover_img.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cover_imgs/1
  # DELETE /cover_imgs/1.json
  def destroy
    @cover_img.destroy
    respond_to do |format|
      format.html { redirect_to cover_imgs_url, notice: 'Cover img was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover_img
      @cover_img = CoverImg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_img_params
      params.require(:cover_img).permit(:comic_id, :cover_img)
    end
end
