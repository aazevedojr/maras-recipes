User.delete_all
Recipe.delete_all
Category.delete_all

standard_times = 42

# USERS
5.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email
  )
  user.password = "password"
  user.save
end


#CATEGORIES
Category.create(name: "Appetizer")
Category.create(name: "Salad")
Category.create(name: "Main Course")
Category.create(name: "Dessert")


# RECIPES
standard_times.times do
  name = Faker::Food.dish
  user_id = User.all.sample.id
  category_id = Category.all.sample.id
  prep_time = rand(5..50)*5
  directions = Faker::Lorem.paragraph
  difficulty = rand(1..5)

  Recipe.create(
    name: name,
    category_id: category_id,
    creator_id: user_id,
    prep_time: prep_time,
    directions: directions,
    difficulty: difficulty
  )
end


# INGREDIENTS
standard_times.times do
  Ingredient.create(
    name: Faker::Food.ingredient
  )
end


# MEASUREMENTS
300.times do
  recipe = Recipe.all.sample.id
  ingredient = Ingredient.all.sample.id
  amount = rand(1..40)*0.25
  metric = [
    'unit',
    'cup',
    'oz',
    'tbsp',
    'tsp',
    'g'
  ].sample

  Measurement.create(
    amount: amount,
    metric: metric,
    recipe_id: recipe,
    ingredient_id: ingredient
  )
end


# RATINGS
standard_times.times do
  user_id = User.all.sample.id
  recipe_id = Recipe.all.sample.id
  rating = rand(1..5)

  Rating.create(
    rating: rating,
    user_id: user_id,
    recipe_id: recipe_id
  )
end
