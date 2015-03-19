class UsersController < ApplicationController
  before_action :get_user, except: :index
  before_action :validate_user, only: [:edit, :update]

  respond_to :html
  layout 'dashboards'

  def show
    @badges = @user.badges.last(10)
    @position = @user.position
    respond_with @user
  end

  def edit
  end

  def update
    old_roles_length = @user.roles.length
    @user.update_attributes(user_params)
    if @user.save
      if @user.roles.length > old_roles_length
        AdminModuleMailer.admin_module(
          @user, @user.roles.last
        ).deliver
      end
      respond_with @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "User was succesfully deleted"
  end

  private

  def validate_user
    redirect_to @user, notice: 'You can\'t edit info of another user' unless can_edit?
  end

  def can_edit?
    current_user.is_admin || current_user.roles.include?(badges_admin) ||
      current_user == @user
  end

  def user_params
    params.require(:user).permit(:name, :bio, :position_id, skill_ids: [],
                                 badge_ids: [], role_ids: [])
  end

  def get_user
    @user = User.find(params[:id])
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def badges_admin
    Role.find_by_name('badges admin')
  end
end
