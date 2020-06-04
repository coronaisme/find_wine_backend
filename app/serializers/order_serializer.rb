class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_id, :order_date, :shipped_to, :total, :wines
end
