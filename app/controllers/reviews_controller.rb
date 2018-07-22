class ReviewsController < ApplicationController

  def create
  @review = Review.new(review_params)
  @review.product_id = params[:product_id] 

    if @review.save
      redirect_to "/products/#{@review.product_id}", notice: "Review was successfully created."
    end
  end

  def destroy
    @review.destroy
  end

  def review_params
    params.require(:review).permit(
    :product_id,
    :user_id, 
    :description,
    :rating)
  end

end