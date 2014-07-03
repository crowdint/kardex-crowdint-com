class ApplicationController < ActionController::Base
  helper_method :email_admins

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

  def email_admins
    @admins ||= User.admins.pluck(:email)
  end
end
