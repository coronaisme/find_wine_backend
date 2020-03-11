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
    if logged_in?
      user = User.find(params[:id])
      order = Order.new(user_id:params[:user_id], status:params[:status], order_date:params[:order_date], shipped_to:params[:shipped_to])

        if order.save
          render json { id: order.id }
        else
          render json: { error: 'Could not find order'}, status: 401
        end
    else
      render json: { error: 'Noone is logged in' }, status: 401
  end

  # def index
  #   all_orders = Order.all 
  #   render json: { all_orders:all_orders }
  # end

  # def show
  #   order = Order.find(params[:id])
  #   render json: { order:order }
  # end



end
