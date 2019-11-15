class FavReviewsController < ApplicationController
  before_action :set_fav_review, only: [:show, :edit, :update, :destroy]

  # GET /fav_reviews
  # GET /fav_reviews.json
  def index
    @fav_reviews = FavReview.all
  end

  # GET /fav_reviews/1
  # GET /fav_reviews/1.json
  def show
  end

  # GET /fav_reviews/new
  def new
    @fav_review = FavReview.new
  end

  # GET /fav_reviews/1/edit
  def edit
  end

  # POST /fav_reviews
  # POST /fav_reviews.json
  def create
    @fav_review = FavReview.new(fav_review_params)

    respond_to do |format|
      if @fav_review.save
        format.html { redirect_to @fav_review, notice: 'Fav review was successfully created.' }
        format.json { render :show, status: :created, location: @fav_review }
      else
        format.html { render :new }
        format.json { render json: @fav_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fav_reviews/1
  # PATCH/PUT /fav_reviews/1.json
  def update
    respond_to do |format|
      if @fav_review.update(fav_review_params)
        format.html { redirect_to @fav_review, notice: 'Fav review was successfully updated.' }
        format.json { render :show, status: :ok, location: @fav_review }
      else
        format.html { render :edit }
        format.json { render json: @fav_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fav_reviews/1
  # DELETE /fav_reviews/1.json
  def destroy
    @fav_review.destroy
    respond_to do |format|
      format.html { redirect_to fav_reviews_url, notice: 'Fav review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fav_review
      @fav_review = FavReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fav_review_params
      params.require(:fav_review).permit(:user_id, :review_id)
    end
end
