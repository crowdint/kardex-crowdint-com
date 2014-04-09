class Admin::BaseController < ApplicationController
  before_filter :authorize_admin

  def authorize_admin
    redirect_to :root unless current_user.is_admin?
  end
end
