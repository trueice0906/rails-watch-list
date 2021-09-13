class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    if @review.save
      redirect_to list_path(@list)
    else
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment,:rating)
  end
end
