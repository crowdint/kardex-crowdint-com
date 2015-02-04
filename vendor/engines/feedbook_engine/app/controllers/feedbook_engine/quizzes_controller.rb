require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class QuizzesController < ApplicationController
    before_action :find_quiz, only: [:show, :update]

    def show
      @quiz = Quiz.new
    end

    def update
      @quiz = Quiz.new(quiz_params)
      if @quiz.save
        redirect_to feedbook_engine.admin_quizzes_url, notice: 'Quiz was successfully created.'
      else
        render :new
      end
    end

    private

    def find_quiz
      @quiz = Quiz.find_by_uuid(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name, :description, :duration, :distribution_skills, :distribution_rule)
    end
  end
end
