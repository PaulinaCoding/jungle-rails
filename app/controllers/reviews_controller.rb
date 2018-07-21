d class ReviewsController < ApplicationController

  def create
    "%%%%%%%"
    params
    "%%%%%%%"
    if @review.save
      redirect_to '/products/#{@review.product_id}/reviews'
    else
      redirect_to '/products/#{@review.product_id}'
    end
    render :plain, 'Worked'
  end

  def destroy
    @review.destroy
  end

  def review_params
    params.require(:review).permit(:user_id, :description, :rating)
  end

end