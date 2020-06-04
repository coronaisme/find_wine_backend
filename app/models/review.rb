class Review < ApplicationRecord
  # validates :wine_id, uniqueness: { scope: :user_id, message: "You have already reviewed this wine" }

  belongs_to :wine
  belongs_to :user
  
end
