class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome! You have registered successfully."
      redirect_to root_path
    else
      flash[:danger] = "Please fix the following errors."
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end