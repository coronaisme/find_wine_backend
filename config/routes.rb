Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/auth', to: 'users#check' #auth user
      post '/new', to: 'users#create' #create
      get '/users/:id', to: 'users#show_user' #show user
      get '/users/:id/:orders', to: 'users#show_orders' #orders by user

      get '/wines', to: 'wines#index' #wines
      get '/wines/:id', to: 'wines#show' #selected wine

      post '/orders/:id', to: 'orders#create' #create order
      
    end
  end  
end