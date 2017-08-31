class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :destroy, :update]
  def index
    @ingredients = Ingredient.all
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @measurement = @ingredient.measurements.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    p @recipe
    @ingredient = Ingredient.find_or_create_by(name: ingredient_params["name"])
    @measurement = @ingredient.measurements.new(ingredient_params["measurements_attributes"]["0"])

    if @ingredient && @measurement.save

      render 'recipes/show'
    else
      @errors = @ingredient.errors.full_messages + @measurement.errors.full_messages
      render 'form'
    end
  end

  def edit
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    if @ingredient.update
      redirect_to edit_recipe_ingredient_path(@recipe, @ingredient)
    else
      @errors = @ingredient.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, measurements_attributes: [:id, :amount, :metric, :recipe_id])
  end
end
