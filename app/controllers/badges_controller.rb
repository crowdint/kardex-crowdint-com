class BadgesController < ApplicationController
  before_action :get_badges, except: :query
  layout 'dashboards'

  def index
  end

  def show
    @badge = BadgesEngine::Badge.find(params[:id])
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

  private

  def get_badges
    @badges = BadgesEngine::Badge.all
  end
end
