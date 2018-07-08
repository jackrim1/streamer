class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :following, :followers]
  #after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    render 'users/_show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    render 'users/_show_follow'
  end
  

  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
