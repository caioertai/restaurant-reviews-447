class ReviewsController < ApplicationController
  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      # redirect_to @restaurant
      # redirect_to restaurant_path(@restaurant)
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
