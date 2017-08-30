class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :recipes, through: :measurements
  has_many :categories, through: :recipes

  validates :name, presence: true
end
