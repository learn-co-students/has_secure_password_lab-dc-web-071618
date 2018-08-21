class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      redirect_to new_user_path
    else
      session[:user_id] = @user.id
      redirect_to :root
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
