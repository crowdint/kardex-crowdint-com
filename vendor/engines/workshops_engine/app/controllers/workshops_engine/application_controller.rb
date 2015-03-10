module WorkshopsEngine
  class ApplicationController < ::ApplicationController
    before_action :restrict_access, :get_last_module

    layout Rails.env.test? ? 'dummy' : 'admin'

    private

    def restrict_access
      redirect_to main_app.user_path(current_user.id) unless
        current_user.roles.include?(workshops_admin) || current_user.is_admin
    end

    def get_last_module
      session[:last_module] = request.url
    end

    def workshops_admin
      Role.find_by_name('workshops admin')
    end
  end
end
