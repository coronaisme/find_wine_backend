class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :dateofbirth, :email, :avatar_url, :city, :state, :address, :zipcode, :reviews, :orders, :created_at

  def orders



    orders = object.orders.map do  |order| 

      { 

        order:order,
        wines:order.wines

       }

      end 

  end


end
