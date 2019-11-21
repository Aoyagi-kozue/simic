class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, only: [:new, :create]

  # GET /reviews/new
  def new
    @comic = Comic.find(params[:comic_id])
    @user = User.find(@comic.user.id)
    @review = Review.new
  end


  # POST /reviews
  # POST /reviews.json
  def create
    @comic = Comic.find(params[:comic_id])
    @review = current_user.reviews.new(review_params)
    @review.tag_list = params[:tag_list]
    @review.comic_id = @comic.id
    p @review
    p review_params
    respond_to do |format|
      if @review.save
        format.html { redirect_to comic_path(@comic), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render 'comics/show' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_id, :comic_id, :review_text, :review_title, :netabare, :tag_list, :star)
    end

end
