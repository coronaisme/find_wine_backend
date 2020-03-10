Rails.application.routes.draw do

  resources :api do
    resources :v1 do

      #../users/:id
      #../users/:id/orders
      #../users/:id/orders/:id
      #(maybe?)
      #../users/:id/friendships
      #../users/:id/friendships/:id
      resources :users do
        resources :orders
        resources :friendships #--> might not be a neccesary route
      end
       
      #.../wines
      #.../wines/:id
      # .../wines/:id/reviews
      #.../wines/:id/reviews/:id
      resources :wines do 
        resources :reviews
      end  
      
    end
  end  
end