class Api::V1::UsersController < ApplicationController
  #validations soon



  #auth check
  def check
    user = User.find_by(name:params[:name])
    if user && user.authenticate(params[:password])
      my_token = issue_token(user)
      render json: { id: user.id, name: user.name, dateofbirth: user.dateofbirth, email: user.email, avatar_url:user.avatar_url, city: user.city, state: user.state, address: user.address, zipcode: user.zipcode, token: my_token }
    else
      render json: { error: "The user could not be found." }, status: 401
    end
  end

  #create user
  def create 
    user = User.new( name:params[:name], password:params[:password], avatar_url:params[:avatar_url], dateofbirth:Date.parse(params[:dateofbirth]), email:params[:email], city:params[:city], state:params[:state], address:params[:address], zipcode:params[:zipcode] )
    if user.save!
      # byebug
      my_token = issue_token(user)
      render json: { id: user.id, name: user.name, zipcode: user.zipcode, avatar_url: user.avatar_url, dateofbirth: user.dateofbirth, email: user.email, city: user.city, state: user.state, token: my_token }
    else
      render json: { error: 'The user could not be created' }, status: 401
    end 
  end

  #show user
  def show_user
    if logged_in? 
      orders = Order.all.select { |order| order.user_id === current_user.id }


      serialization = ActiveModel::SerializableResource.new(current_user).as_json
     





      reviews = Review.all.select { |review| review.user_id === current_user.id} 
      render json: { user_details: serialization, orders: orders, reviews: reviews }.to_json

      # render json: current_user
    else
      render json: { error: 'No user could be found', status: 401 }
    end
  end

  #show orders
  def show_orders
    user = User.find(params[:id])
    user_orders = Order.all.select{ |order| order.user_id === user.id }
    render json: { user_orders: user_orders }
  end



end
