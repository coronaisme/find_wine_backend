class Api::V1::ReviewsController < ApplicationController


  #reviews are for wine not for user
  def index 
    all_reviews = Review.all 
    reviews_with_user = all_reviews.map{ |review| {review:review, user:review.user} }
    render json: {reviews:reviews_with_user }
  end
 

  def show
    review = Review.find(params[:id])
    review_user = User.find_by(id:review.user_id)
  end

  def create 
        review = Review.new(content:params[:content], wine_id:params[:wine_id], user_id:params[:user_id])
        
        if review.save 
          render json: { review: review, user:review.user }
        else 
          render json: { error: 'You may only write a review of a wine once!' }, status: 401
        end     
  end

end
