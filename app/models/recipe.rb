class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :title, uniqueness: true
  scope :ordered_by_title, -> { order(title: :asc) }
  accepts_nested_attributes_for :category, reject_if: :all_blank
end
