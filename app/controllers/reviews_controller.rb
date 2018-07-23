class ReviewsController < ApplicationController



  def create
    @review = Product.find(params[:product_id]).reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to "/products/#{@review.product_id}", notice: "Review was successfully created."
    else
      redirect_to "/products/#{@review.product_id}", notice: "Review hasn't been saved!"
    end
  end

  def destroy
    @review.destroy
  end

  def review_params
    puts params
     params.require(:review).permit(
      :rating,
      :description
    )
  end


end