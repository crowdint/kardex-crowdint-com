require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class QuizzesController < ApplicationController

    skip_before_action :restrict_access
    before_action :find_quiz, only: [:show, :update]
    before_action :find_user_quiz, only: [:start, :next, :finish]

    def show
      @user_quiz = QuizUser.generate_user_quiz(current_user.id, @quiz.id) unless @user_quiz
    end

    def start
      binding.pry
      session[:current_quiz] = @user_quiz.id
      session[:current_question] = @question.id
    end

    def next
    end

    def finish
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
      @user_quiz = QuizUser.where( quiz_id: @quiz.id, user_id: current_user.id, state: 'active').first
    end

    def find_user_quiz
      @user_quiz = QuizUser.find_by_uuid(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name, :description, :duration, :distribution_skills, :distribution_rule)
    end
  end
end
