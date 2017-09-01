class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :directions
  has_many :ingredients
end
