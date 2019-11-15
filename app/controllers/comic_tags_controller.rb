class ComicTagsController < ApplicationController
  before_action :set_comic_tag, only: [:show, :edit, :update, :destroy]

  # GET /comic_tags
  # GET /comic_tags.json
  def index
    @comic_tags = ComicTag.all
  end

  # GET /comic_tags/1
  # GET /comic_tags/1.json
  def show
  end

  # GET /comic_tags/new
  def new
    @comic_tag = ComicTag.new
  end

  # GET /comic_tags/1/edit
  def edit
  end

  # POST /comic_tags
  # POST /comic_tags.json
  def create
    @comic_tag = ComicTag.new(comic_tag_params)

    respond_to do |format|
      if @comic_tag.save
        format.html { redirect_to @comic_tag, notice: 'Comic tag was successfully created.' }
        format.json { render :show, status: :created, location: @comic_tag }
      else
        format.html { render :new }
        format.json { render json: @comic_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comic_tags/1
  # PATCH/PUT /comic_tags/1.json
  def update
    respond_to do |format|
      if @comic_tag.update(comic_tag_params)
        format.html { redirect_to @comic_tag, notice: 'Comic tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @comic_tag }
      else
        format.html { render :edit }
        format.json { render json: @comic_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comic_tags/1
  # DELETE /comic_tags/1.json
  def destroy
    @comic_tag.destroy
    respond_to do |format|
      format.html { redirect_to comic_tags_url, notice: 'Comic tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic_tag
      @comic_tag = ComicTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_tag_params
      params.require(:comic_tag).permit(:comic_id, :tag_id)
    end
end
