require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class Admin::QuizzesController < ApplicationController
    before_action :find_quiz, only: [:show, :edit, :update, :destroy]

    def index
      @quizzes = Quiz.all
    end

    def new
      @quiz = Quiz.new
    end

    def edit
    end

    def create
      @quiz = Quiz.new(quiz_params)
      if @quiz.save
        redirect_to feedbook_engine.admin_quizzes_url, notice: 'Quiz was successfully created.'
      else
        render :new
      end
    end

    def update
      if @quiz.update(quiz_params)
        redirect_to feedbook_engine.admin_quizzes_url, notice: 'Quiz was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @quiz.destroy
      redirect_to feedbook_engine.admin_quizzes_url, notice: 'Quiz was successfully destroyed.'
    end

    private

    def find_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name, :description, :duration, :distribution_skills, :distribution_rule)
    end
  end
end
