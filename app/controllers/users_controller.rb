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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      respond_with @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :position_id, skill_ids: [])
  end
end
