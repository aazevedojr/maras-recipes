class Measurement < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :amount, :metric, presence: true
end
