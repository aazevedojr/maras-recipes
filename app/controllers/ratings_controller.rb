class RatingsController < ApplicationController

  def create
    @rating = Rating.new(ratings_params)
    if @rating.save
      redirect_to recipe_path(@rating.recipe)
    else
      @errors = @rating.errors.full_messages
      render '/recipes/show'
    end
  end

  private

  def ratings_params
    params.require(:rating).permit(:rating, :user_id, :recipe_id)
  end

end
