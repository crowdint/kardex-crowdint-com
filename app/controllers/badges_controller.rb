class BadgesController < ApplicationController
  before_action :get_instance_variables, except: :query
  layout 'dashboards'

  def index
    @badges = if params[:search]
              BadgesEngine::Badge.where("name ILIKE ?",
                                  "%#{params[:search]}%")
            else
              BadgesEngine::Badge.all.order(sort_column + " " + sort_direction)
    end
  end

  def show
    @badge = BadgesEngine::Badge.find(params[:id])
  end

  def query
    if params[:search]
      @user = BadgesEngine::Badge.where(
        'name ILIKE ? OR email ILIKE',
        "%#{ params[:search] }", "%#{ params[:search] }%")
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

  def sort_column
    BadgesEngine::Badge.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
