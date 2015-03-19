require_dependency 'badges_engine/application_controller'

module BadgesEngine
  class BadgesController < ApplicationController
    before_action :get_instance_variables
    layout 'dashboards'

    def index
      if params[:search]
        @badges = Badge.search_badges(params[:search]).sort_by_column_direction
      end
    end

    def show
      @badge = Badge.find(params[:id])
    end

    def query
    end

    def my_badges
      @user = User.find(params[:user_id])
      @badges = @user.badges
      if params[:search]
        @badges = Badge.search_user_badges(@user, params[:search]).
          sort_by_column_direction
      end
    end

    private

    def get_instance_variables
      @badges = Badge.all
      @nominee_user = NomineeUser.new
      @propose_badge = ProposeBadge.new
    end
  end
end
