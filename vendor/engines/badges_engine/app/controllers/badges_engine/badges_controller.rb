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

    private

    def get_instance_variables
      @badges = BadgesEngine::Badge.all
      @nominee_user = NomineeUser.new
      @propose_badge = ProposeBadge.new
    end
  end
end
