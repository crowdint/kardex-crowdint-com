class Admin::UsersController < Admin::BaseController
  helper_method :sort_column, :sort_direction

  def index
    @users = if params[:search]
              User.where("name ILIKE ? OR email ILIKE ?",
                         "%#{params[:search]}%", "%#{params[:search]}%")
                  .order(sort_column + " " + sort_direction)
            else
              User.order(sort_column + " " + sort_direction)
    end
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
