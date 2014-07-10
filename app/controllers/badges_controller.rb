class BadgesController < ApplicationController
  before_action :get_instance_variables, except: :query
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

  def get_instance_variables
    @badges = BadgesEngine::Badge.all
    @nominee_user = NomineeUser.new
    @propose_badge = ProposeBadge.new
  end
end
