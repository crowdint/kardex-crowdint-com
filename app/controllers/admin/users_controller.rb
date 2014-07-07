class Admin::UsersController < Admin::BaseController

  def index
    @users = if params[:search]
              User.where("name ILIKE ? OR email ILIKE ?",
                                  "%#{params[:search]}%", "%#{params[:search]}%")
            else
              User.all
    end
  end

end
