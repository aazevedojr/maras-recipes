class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :destroy, :update]
  def index
    @ingredients = Ingredient.all
  end

  def new
    # @recipe = 1
    @metric_options = ["unit", "cup", "oz", "tbsp", "tsp", "g"]
    @ingredient = Ingredient.new
    1.times { @ingredient.measurements.new }
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to root_path
    else
      @errors = @ingredient.errors.full_messages
      render 'new'
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
    params.require(:ingredient).permit(:name, measurements_attributes: [:amount, :metric, :recipe_id])
  end
end
