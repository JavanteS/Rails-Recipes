class Category < ApplicationRecord
  has_many :recipes
  has_many :users, through: :recipes
  accepts_nested_attributes_for :recipes
  validates :name, presence: true
  validates :name, uniqueness: true
end
