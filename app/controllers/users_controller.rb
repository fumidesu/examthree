class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    #@user = User.find(image_params)
    @user = User.find(params[:id])
  end


end
