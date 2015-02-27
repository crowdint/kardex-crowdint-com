require_dependency 'badges_engine/application_controller'

module BadgesEngine
  class Admin::BadgesController < ApplicationController
    before_action :set_badge, only: [:edit, :update, :destroy]
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

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_url, notice: 'Badge was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_url, notice: 'Badge was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @badge.destroy
      redirect_to admin_badges_url, notice: 'Badge was successfully deleted.'
    end

    private

    def badge_params
      params.require(:badge).permit(
        :name,
        :image,
        :description,
        :award_id,
        :value_id,
        levels_attributes: [:id, :tier, :badge_alias, :badge_id, :_destroy]
      )
    end

    def set_badge
      @badge = Badge.find(params[:id])
    end

    def sort_column
      Badge.column_names.include?(params[:sort]) ? params[:sort] : 'name'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
  end
end
