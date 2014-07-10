class BadgesController < ApplicationController
  before_action :get_badges, except: :query
  layout 'dashboards'

  def index
    @badges = if params[:search]
              BadgesEngine::Badge.where("name ILIKE ?",
                                  "%#{params[:search]}%")
            else
              BadgesEngine::Badge.all
    end
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
      @user + BadgesEngine::Badge.all
    end
  end

  private

  def get_badges
    @badges = BadgesEngine::Badge.all
  end
end
