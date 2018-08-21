class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to users_new_path
    else
      @user = User.create(user_params)
      return redirect_to 'users/new' unless @user.save
      session[:user_id] = @user.id
      redirect_to users_welcome_path
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
