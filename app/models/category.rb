class Category < ApplicationRecord
  has_many :recipes
  has_many :users, through: :recipes

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

   before_save { name.capitalize! }


   
end
