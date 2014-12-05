require_dependency "workshops_engine/application_controller"

module WorkshopsEngine
  class WorkshopsController < ApplicationController
    before_action :find_workshop, only: [:show, :edit, :update, :destroy]
    layout 'dashboards'

    def index
      @workshops = WorkshopsEngine::Workshop.all
    end

    def show
    end

    private

    def find_workshop
      @workshop = Workshop.find(params[:id])
    end
  end
end
