class BadgesController < ApplicationController
  before_action :get_instance_variables, except: :query
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

  def get_instance_variables
    @badges = BadgesEngine::Badge.all
    @nominee_user = NomineeUser.new
    @propose_badge = ProposeBadge.new
  end
end
