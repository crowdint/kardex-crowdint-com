require_dependency 'badges_engine/application_controller'

module BadgesEngine
  class Admin::BadgesController < ApplicationController
    helper_method :sort_column, :sort_direction
    layout 'admin'

    def index
      @badges = if params[:search]
                  Badge.where("name ILIKE ?", "%#{params[:search]}%").order(sort_column + ' ' + sort_direction)
                else
                  Badge.order(sort_column + ' ' + sort_direction)
                end
    end

    def new
      @badge = Badge.new
      @level = @badge.levels.build
    end

    private

    def sort_column
      Badge.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
