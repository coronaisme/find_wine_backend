class UsersController < ApplicationController
  #auth check
  def check
    user = User.find_by(name:params[:name])
    if user && user.authenticate(params[:password])
      my_token = issue_token(user)
      render json: { id: user.id, name: user.name, age: user.age, email: user.email, city: user.city, state: user.state, address: user.address, zipcode: user.zipcode, token: my_token }
    else
      render json: { error: "The user could not be found." }, status: 401
    end
  end

  #create user
  def create 
    user = User.new( name:params[:name], password:params[:password], age:params[:age], email:params[:email], city:params[:city], state:params[:state], address:params[:address], zipcode:params[:zipcode] )
    if user.save
      my_token = issue_token(user)
      render json: { id: user.id, name: user.name, zipcode: user.zipcode, age: user.age, email: user.email, city: user.city, state: user.state token: my_token }
    else
      render json: { error: 'The user could not be created'}, status: 401
    end 
  end

  #show user
  def show_user
    if logged_in? 
      orders = Order.all.select { |order| order.user_id === current_user.id }
      render json: { user_details: current_user, orders: orders }
    else
      render json: { error: 'No user could be found', status: 401 }
    end
  end
  
  #show orders
  def show_orders
    user = User.find_by(name:params[:name])
    user_orders = Order.all.select{ |order| order.user_id === user.id }
    render json: { user_orders: user_orders }
  end

end
