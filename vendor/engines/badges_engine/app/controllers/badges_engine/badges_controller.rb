require_dependency 'badges_engine/application_controller'

module BadgesEngine
  class BadgesController < ApplicationController
    before_action :get_instance_variables
    layout 'dashboards'

    def index
    end

    def show
      @badge = BadgesEngine::Badge.find(params[:id])
    end

    def query
    end

    def my_badges
      @user = User.find(params[:user_id])
      if params[:search]
        @badges = @user.badges.where("name ILIKE ?", "%#{ params[:search] }%")
        .order(sort_column + " " + sort_direction)
      end
    end

    private

    def get_instance_variables
      @badges = BadgesEngine::Badge.all
      @nominee_user = NomineeUser.new
      @propose_badge = ProposeBadge.new
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  end
end
