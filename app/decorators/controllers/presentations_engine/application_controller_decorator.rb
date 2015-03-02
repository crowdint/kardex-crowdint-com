PresentationsEngine::ApplicationController.class_eval do
  before_action :restrict_access, :get_last_module

  private

  def restrict_access
    redirect_to session[:last_module] unless
      current_user.roles.include?(presentations_admin) || current_user.is_admin
  end

  def get_last_module
    session[:last_module] = request.url
  end

  def presentations_admin
    Role.find_by_name('presentations admin')
  end
end
