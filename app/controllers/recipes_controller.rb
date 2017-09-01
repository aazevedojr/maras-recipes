class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :destroy, :update, :show]

  def index
    @recipes = Recipe.all
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    if current_user
      @rated = Rating.find_by(recipe_id: @recipe.id, user_id: @user.id)
    end
    @rating = Rating.new if @user && !@rated
    @avg_rating = @recipe.ratings.average(:rating).to_f.round
  end

  def new
    @category = Category.find(params[:category_id])
    @recipe = Recipe.new
  end

  def create
    @category = Category.find(params[:category_id])
    @recipe = @category.recipes.new(recipe_params.merge({creator_id: current_user.id}))


    if @recipe.save
      redirect_to new_recipe_ingredient_path(@recipe)
    else
      @errors = @recipe.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      @errors = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to user_path(current_user)
  end

private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :category_id, :creator_id, :prep_time,
      :directions, :difficulty)
  end
end
