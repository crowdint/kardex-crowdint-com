require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class Admin::QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update, :destroy]

    def index
      @questions = Question.all
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
        @question.waiting_to_review
        redirect_to feedbook_engine.admin_questions_url, notice: 'Question was successfully created.'
      else
        render :new
      end
    end

    def update
      if @question.update(question_params)
        redirect_to feedbook_engine.admin_questions_url, notice: 'Question was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @question.remove
      redirect_to feedbook_engine.admin_questions_url, notice: 'Question was successfully destroyed.'
    end

    private

    def find_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:name, :description, :duration, :level_id, :type_question, :tags, answers_attributes: [:id, :text, :is_valid, :_destroy])
    end
  end
end

