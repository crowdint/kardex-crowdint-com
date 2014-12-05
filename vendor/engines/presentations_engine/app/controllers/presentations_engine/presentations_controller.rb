require_dependency "presentations_engine/application_controller"

module PresentationsEngine
  class PresentationsController < ApplicationController
    before_action :find_presentation, only: [:show, :edit, :update, :destroy]

    def index
      @presentations = if params[:filter]
        Presentation.where("date = ?", params[:filter].to_date)
        .order('date')
      elsif params[:search]
        Presentation.where("title ILIKE ?", "%#{params[:search]}%")
      else
        Presentation.all
      end
    end

    def show
    end

    def new
      @presentation = Presentation.new
    end

    def edit
    end

    def create
      @presentation = Presentation.new(presentation_params)
      if @presentation.save
        redirect_to presentations_url, notice:
          'Presentation was successfully created.'
      else
        render 'new'
      end
    end

    def update
      if @presentation.update(presentation_params)
        redirect_to @presentation, notice: 'presentation was successfully updated.'
      else
        render 'edit'
      end
    end

    def destroy
      @presentation.destroy
      redirect_to presentations_url, notice: 'presentation was successfully destroyed.'
    end

    private

    def find_presentation
      @presentation = Presentation.find(params[:id])
    end

    def presentation_params
      params.require(:presentation).permit(:title, :description,
        :user_id, :date)
    end
  end
end
