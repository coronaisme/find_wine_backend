class Wine < ApplicationRecord
  belongs_to :order, optional: true
  has_many :reviews
end
