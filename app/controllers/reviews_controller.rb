class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if review.save
      redirect_to '/products/#{@review.product_id}'
    else
      redirect_to '/products/#{@review.product_id}'
    end
  end

  def destroy
    @review.destroy
  end

  def review_params
    params.require(:review).permit(:user_id, :description, :rating)
  end

end