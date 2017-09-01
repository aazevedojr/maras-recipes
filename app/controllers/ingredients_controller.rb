class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :destroy, :update]
  before_action :set_recipe, only: [:new, :create, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @js = true
    @ingredient = Ingredient.new
    @measurement = @ingredient.measurements.build
  end

  def create
    @ingredient = Ingredient.find_or_create_by(name: ingredient_params["name"])
    @measurement = @ingredient.measurements.new(ingredient_params["measurements_attributes"]["0"])

    respond_to do |f|
      if @ingredient && @measurement.save
        f.html{ redirect_to recipe_path(@recipe) }
        f.js { render 'done' }
      else
        @errors = @ingredient.errors.full_messages + @measurement.errors.full_messages
        f.html { render 'new'}
        f.js { render 'fail' }
      end
    end
  end

  def edit
    @js = false
  end

  def update
    @ingredient.update_attributes(ingredient_params)

    if @ingredient.valid?
       redirect_to recipe_path(@recipe)
    else
      @errors = @ingredient.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, measurements_attributes: [:id, :amount, :metric, :recipe_id])
  end
end
