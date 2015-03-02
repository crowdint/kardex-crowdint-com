class ApplicationController < ActionController::Base
  helper_method :admin_emails, :all_emails

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    resource.is_a?(User) ? user_path(current_user) : super
  end

  private

  def admin_emails
    @admins ||= User.admins.pluck(:email)
  end

  def all_emails
    @all ||= User.all.pluck(:email)
  end
end
