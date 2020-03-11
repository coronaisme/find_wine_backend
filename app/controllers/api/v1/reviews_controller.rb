class Api::V1::ReviewsController < ApplicationController
  #validation - a user can only review a wine once 
  validates :wine_id, uniqueness: { scope: :user_id, message: "You have already reviewed this wine" }


  

  #reviews are for wine not for user
  def index 
    all_reviews = Review.all 
    wine = Wine.find(params[:wine_id])
  end

  def show
    review = Review.find(params[:id])
  end

  def create 
    if logged_in?
        user = User.find_by(name:params[:name])
        review = Review.new(content:params[:content], wine_id:params[:wine_id])
        
        if review.save 
          render json: { id: review.id }
        else 
          render json: { error: 'Contact support team for further details' }, status: 401
        end
      end
    else
      render json : { error: 'Must be logged in to create a review' }, status: 401
    end
  end



end
