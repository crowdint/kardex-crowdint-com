require_dependency "badges_engine/application_controller"

module BadgesEngine
  class ValuesController < ApplicationController
    before_action :set_value, only: [:show, :edit, :update, :destroy]

    def index
      @values = Value.all
    end

    def show
    end

    def new
      @value = Value.new
    end

    def edit
    end

    def create
      @value = Value.new(value_params)
      if @value.save
        redirect_to @value, notice: 'Value was successfully created.'
      else
        render :new
      end
    end

    def update
      if @value.update(value_params)
        redirect_to @value, notice: 'Value was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @value.destroy
      redirect_to values_url, notice: 'Value was successfully destroyed.'
    end

    private

    def set_value
      @value = Value.find(params[:id])
    end

    def value_params
      params.require(:value).permit(:name, :description)
    end
  end
end
