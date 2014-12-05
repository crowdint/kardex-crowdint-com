require_dependency "badges_engine/application_controller"

module BadgesEngine
  class LevelsController < ApplicationController
    before_action :set_level, only: [:show, :edit, :update, :destroy]

    def index
      @levels = Level.all
    end

    def show
    end

    def new
      @level = Level.new
    end

    def edit
    end

    def create
      @level = Level.new(level_params)
      if @level.save
        redirect_to @level, notice: 'level was successfully created.'
      else
        render 'new'
      end
    end

    def update
      if @level.update(level_params)
        redirect_to @level, notice: 'level was successfully updated.'
      else
        render 'edit'
      end
    end

    def destroy
      @level.destroy
      redirect_to levels_url, notice: 'level was successfully destroyed.'
    end

    private

    def set_level
      @level = Level.find(params[:id])
    end

    def level_params
      params.require(:level).permit(:badge_id , :tier, :badge_alias)
    end
  end
end
