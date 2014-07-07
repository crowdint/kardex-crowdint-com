class BadgesController < ApplicationController
  layout 'dashboards'

  def index
    @badges = BadgesEngine::Badge.all
  end

  def query
    if params[:search]
      @user = BadgesEngine::Badge.where(
        'name ILIKE ? OR email ILIKE',
        '%#{ params[:search] }', '%#{ params[:search] }')
    else
      @user + BadgesEngine::Badges.all
    end
  end
end
