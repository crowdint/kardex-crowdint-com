class UsersController < ApplicationController
  before_action :get_user, except: :index
  respond_to :html

  def index
    @users = User.order(:name)
    respond_with @users
  end

  def show
    respond_with @user
  end

  def edit
  end

  def update
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

  def get_user
    @user = User.find(params[:id])
  end
end
