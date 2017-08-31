class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: :User
  has_many :measurements
  has_many :ingredients, through: :measurements
  has_many :ratings

  validates :name, :prep_time, :directions, :difficulty, presence: true
end
