class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]
  before_action :set_restaurant, only: [:create, :new]
  def index
    @reviews = Review.all
    # raise
  end

  def show; end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
