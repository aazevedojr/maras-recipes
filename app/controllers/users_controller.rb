class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
    @user = User.new
    render
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = "Welcome to Mara's Recipes!"
      redirect_to root_path
    else
      render 'new'
    end
  end

 def edit
    @user = current_user
end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
