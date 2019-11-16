class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :edit, :update, :destroy]

  require 'net/http'
  require 'uri'

  # GET /comics
  # GET /comics.json
  def index
    @comics = Comic.all
  end

  # GET /comics/1
  # GET /comics/1.json
  def show
    @comic = Comic.find(params[:id])
    @user = User.find(@comic.user.id)
    @review = Review.new
  end

  def search
    keyword = params[:search]
    # @results = request("https://www.googleapis.com/books/v1/volumes?q="+keyword)    
    # uri = "https://www.googleapis.com/books/v1/volumes?q=isbn:4839962227"
    uri = "https://www.googleapis.com/books/v1/volumes?q="+keyword
    params = {
     format: "json",
     Country: "JP",
     maxResults: 40
    }

    client = HTTPClient.new
    request =  client.get(uri,params)
    response = JSON.parse(request.body)
    @comics = response["items"]
    # @titles = []
    # @results.each do |item|
    #   @titles.push item.title
    # end
    # @form = Googlebook.new(params.require(:googlebook_find_form))
    @comic = Comic.new
  end

  # GET /comics/new
  def new
    # @comic = GoogleBooks.search(params[:search],{:count => 20}).map{|googlebook| 
    #   comic = Comic.new
    #   comic.title = googlebook.title
    #   comic.author.author = googlebook.authors
    #   comic.publisher.publisher = googlebook.publisher
    #   comic.cover_img.cover_img = googlebook.image_link
    #   comic
    # }
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics
  # POST /comics.json
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    @user = current_user

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: 'Comic was successfully created.' }
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
