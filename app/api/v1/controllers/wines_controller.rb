class WinesController < ApplicationController
  #all wines
  def index 
    all_wines = Wine.all
  end
  #single wine
  def show 
    all_wines = Wine.all 
    wine = Wine.find(params[:id])
    #all reviews for specific wine
    reviews = wine.reviews
  end
 

end
