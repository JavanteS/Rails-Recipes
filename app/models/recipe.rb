class Recipe < ApplicationRecord
  has_many :reviews

  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  # validates :title, uniqueness: true
  scope :ordered_by_title, -> { order(title: :asc) }
  accepts_nested_attributes_for :category, reject_if: :all_blank


  def category_attributes=(category_hash)
    #binding.pry
    if category_hash[:name].blank?

    else
      
     category = Category.find_or_create_by(name: category_hash[:name].capitalize)
     self.category = category

    end
    
  end
end
