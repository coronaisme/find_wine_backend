class Api::V1::OrdersController < ApplicationController

  #do i only need this for users? otherwise can i just use if logged_in?
  def check
    user = User.find_by(name:params[:name])
    if user && user.authenticate(params[:password])
      my_token = issue_token(user)
      render json: { id: user.id, name:user.name, zipcode:user.zipcode, token:my_token}
    else
      render json: { error: "User could not be found" }, status: 401
    end
  end


  def create
    # if logged_in?
    # byebug
      user = User.find_by(id:params[:id])
      order = Order.new(user_id:params[:user_id], status:params[:status], shipped_to:params[:shipped_to], total:params[:total])

        if order.save
          render json: { order:order, id: order.id }
        else
          render json: { error: 'Could not find order'}, status: 401
        end
    # else
    #   render json: { error: 'Noone is logged in' }, status: 401
    # end
  end



end
