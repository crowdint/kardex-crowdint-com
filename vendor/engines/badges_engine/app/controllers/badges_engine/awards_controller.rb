require_dependency "badges_engine/application_controller"

module BadgesEngine
  class AwardsController < ApplicationController
    before_action :set_award, only: [:show, :edit, :update, :destroy]

    def index
      @awards = Award.all
    end

    def show
    end

    def new
      @award = Award.new
    end

    def edit
    end

    def create
      @award = Award.new(award_params)
      if @award.save
        redirect_to @award, notice: 'Award was successfully created.'
      else
        render 'new'
      end
    end

    def update
      if @award.update(award_params)
        redirect_to @award, notice: 'Award was successfully updated.'
      else
        render 'edit'
      end
    end

    def destroy
      @award.destroy
      redirect_to awards_url, notice: 'Award was successfully destroyed.'
    end

    private

    def set_award
      @award = Award.find(params[:id])
    end

    def award_params
      params.require(:award).permit(:title, :description)
    end
  end
end
