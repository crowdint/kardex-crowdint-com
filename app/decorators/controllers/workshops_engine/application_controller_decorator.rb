WorkshopsEngine::ApplicationController.class_eval do
before_action :restrict_access, :get_last_module

  private

  def restrict_access
    redirect_to session[:last_moudle] unless current_user.
      roles.include?(workshops_admin) || current_user.is_admin
  end

  def get_last_module
    session[:last_moudle] = request.url
  end

  def workshops_admin
    Role.find_by_name('workshops admin')
  end
end
