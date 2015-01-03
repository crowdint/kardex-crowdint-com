require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class Admin::QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update, :destroy]

    def index
      @question = Question.all
    end

    def new
      @question = Question.new
      @question.answers.build
    end

    def edit
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to questions_url, notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    def update
      # if @workshop.update(workshop_params)
      #   if workshop_params[:is_published]
      #     WorkshopNotificationMailer.workshop_notification(
      #       @workshop, all_emails
      #     ).deliver
      #   end
      #   redirect_to workshops_url, notice: 'Question was successfully updated.'
      # else
      #   render :edit
      # end
    end

    def destroy
      # @workshop.destroy
      # redirect_to workshops_url, notice: 'Workshop was successfully destroyed.'
    end

    private

    def find_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit()
    end
  end
end

