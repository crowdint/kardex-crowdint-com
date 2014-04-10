class UsersController < ApplicationController
  respond_to :html

  def index
    @users = User.order(:name)
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
