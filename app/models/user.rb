class User < ApplicationRecord
  has_secure_password

  has_many :recipes, foreign_key: :creator_id
  has_many :ratings

  validates :username, :email, presence: true, uniqueness: true
end
