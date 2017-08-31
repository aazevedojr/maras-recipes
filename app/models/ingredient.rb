class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :recipes, through: :measurements
  has_many :categories, through: :recipes
  accepts_nested_attributes_for :measurements, allow_destroy: true

  validates :name, presence: true
end
