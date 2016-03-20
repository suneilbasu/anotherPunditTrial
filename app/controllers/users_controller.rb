class UsersController < ApplicationController

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize User
  end

  def update
    @user = User.find(params[:id])
    authorize User
    if @user.update_attributes(secure_params)
      redirect_to root_path, notice => "all good"
    else
      redirect_to root_path, :alert => "didn't work out"
    end
  end
  private
  def secure_params
    params.require(:user).permit(:role)
  end
end
