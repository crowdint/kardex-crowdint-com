class Admin::UsersController < Admin::BaseController
  helper_method :search_user, :arrange_all_users
  before_action :restrict_access, :get_last_module

  def index
    @users = if params[:search]
              search_user
            else
              arrange_all_users
    end
  end

  private

  def search_user
    User.where("name ILIKE ? OR email ILIKE ?",
               "%#{params[:search]}%", "%#{params[:search]}%").order(sort_column + " " + sort_direction)
  end

  def arrange_all_users
    User.order(sort_column + " " + sort_direction)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def restrict_access
    redirect_to session[:last_moudle] unless current_user.
      roles.include?(badges_admin) || current_user.is_admin
  end

  def get_last_module
    session[:last_moudle] = request.url
  end

  def badges_admin
    Role.find_by_name('badges admin')
  end
end
