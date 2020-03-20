Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/auth', to: 'users#check' #auth user
      post '/new', to: 'users#create' #create
      get '/users/:id', to: 'users#show_user' #show user
      get '/users/:id/:orders', to: 'users#show_orders' #orders by user

      get '/wines', to: 'wines#index' #wines
      get '/wines/:id', to: 'wines#show' #selected wine
      
      # get '/wines/cabernetsauvignon', to: 'wines#show_cabs' #show cabs bad idea


      post '/orders/:id', to: 'orders#create' #create order

      get '/reviews', to: 'reviews#index' #i want to see the reviews, for ttesting
      
    end
  end  
end