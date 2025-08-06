class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie),
        notice: "Thanks for the review!"
    else
      render :new, status: :unprocessable_content
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
