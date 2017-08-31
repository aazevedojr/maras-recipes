module IngredientsHelper

  def find_metrics(ingredient, recipe)
    display_measurement = ingredient.measurements.where(ingredient_id: ingredient.id, recipe_id: recipe.id).first
    "#{display_measurement.amount}#{display_measurement.metric}"
  end
end
