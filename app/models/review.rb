class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :heading, presence: true 
end
