class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authorize_admin

  def authorize_admin
    redirect_to :root unless current_user.is_admin?
  end
end
