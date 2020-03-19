class Api::V1::WinesController < ApplicationController
  #all wines
  def index 
    all_wines = Wine.all
    render json: { wines:all_wines }
  end

  #single wine
  def show 
    all_wines = Wine.all 
    wine = Wine.find(params[:id])
    #all reviews for specific wine
    reviews = wine.reviews

    render json: { wine: wine, reviews:reviews }
  end


  # bad idead
  # def show_cabs
  #   cabs = Wine.where(varietal:"Cabernet Sauvignon")
  #   render json: { cabs: cabs }
  # end

end
