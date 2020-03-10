class Wine < ApplicationRecord
  belongs_to :order
  has_many :reviews
end
