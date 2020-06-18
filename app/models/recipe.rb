class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # validates :title, presence: true
  # validates :title, uniqueness: true
end
