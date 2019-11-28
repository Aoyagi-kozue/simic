class ComicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  require 'net/http'
  require 'uri'
  require 'cgi'

  # GET /comics
  # GET /comics.json
  def index
    if params[:search].blank?
      @comics = Comic.page(params[:page]).per(10).order(created_at: :desc)
    else
      title = Comic.where("title LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
      author = Comic.where("author LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
      tagname =  Comic.joins(review: :tags).where("name LIKE ?", "%#{params[:search]}%").order(created_at: :desc)
       a = ( title | author )
       @comic = ( a | tagname )
       @comics = Kaminari.paginate_array(@comic).page(params[:page]).per(10)
    end
  end

  def tag_index
    if params[:tag]
      @reviews = Review.tagged_with(params[:tag])

    else
      render 'comics#index'
    end
    @type = params[:tag]
    @tag_reviews = @reviews.includes(:comic).page(params[:page]).per(10).order("id DESC")
    @tag_reviews = Kaminari.paginate_array(@tag_reviews).page(params[:page]).per(10)

  end


  # GET /comics/1
  # GET /comics/1.json
  def show
    @comic = Comic.find(params[:id])
    @user = User.find(@comic.user.id)
  end

  def search
    if params[:search].blank?
      render '/comics/new'
    else
      keyword = params[:search]
      # @results = request("https://www.googleapis.com/books/v1/volumes?q="+keyword)
      # uri = "https://www.googleapis.com/books/v1/volumes?q=isbn:4839962227"
      keyword = CGI.escape(keyword)
      uri = "https://www.googleapis.com/books/v1/volumes?q=intitle:"+keyword+"&country=JP&langRestrict=ja&orderBy=newest"
      params = {
       format: "json",
       Country: "JP",
       maxResults: 40
      }

      client = HTTPClient.new
      request =  client.get(uri,params)
        response = JSON.parse(request.body)
        unless ["totalItems"] == 0
          @comics = response["items"]
          @comic = Comic.new
        else
          render '/comics/new'
        end
    end
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    @user = current_user

    respond_to do |format|
      if @comic.save
        format.html { redirect_to new_comic_reviews_path(@comic), notice: 'Comic was successfully created.' }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1
  # PATCH/PUT /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: 'Comic was successfully updated.' }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1
  # DELETE /comics/1.json
  def destroy
    @comic.destroy
    respond_to do |format|
      format.html { redirect_to comics_url, notice: 'Comic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comic_params
      params.require(:comic).permit(:author, :publisher, :title, :cover_img)
    end
end
