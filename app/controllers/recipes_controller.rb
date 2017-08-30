class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :destroy, :update, :show]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to new_recipe_ingredient_path
    else
      @errors = @recipe.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update
      redirect_to edit_recipe_ingredient_path
    else
      @errors = @recipe.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
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
