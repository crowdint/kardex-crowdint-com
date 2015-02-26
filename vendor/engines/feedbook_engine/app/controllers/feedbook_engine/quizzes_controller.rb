require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class QuizzesController < ApplicationController

    skip_before_action :restrict_access
    before_action :find_quiz, only: [:start]
    before_action :find_user_quiz, only: [:show, :finish, :update]
    before_action :find_user_question, only: [:show, :finish, :update]

    def show
      next_question

      if @user_quiz.users_questions.not_answered.count == 0
        redirect_to finish_quiz_url(@user_quiz.uuid)
      end
    end

    def start
      @user_quiz = UserQuiz.generate_user_quiz(current_user.id, @quiz.id) unless @user_quiz
    end

    def finish
    end

    def update
      errors = []
      params[:answers].each do |answer_id|
        user_answer = @user_question.user_answers.build
        user_answer.answer_id = answer_id
        errors << user_answer.errors unless user_answer.save
      end

      @user_question.answered = true
      @user_question.save

      render json: { redirect: user_quiz_url(@user_quiz.uuid), errors: errors }, status: errors.present? ? 422 : 200
    end

    private

    def find_quiz
      @quiz = Quiz.find_by_uuid(params[:id])
      @user_quiz = UserQuiz.where( quiz_id: @quiz.id, user_id: current_user.id, state: 'active').first
    end

    def find_user_quiz
      @user_quiz = UserQuiz.find_by_uuid(params[:id])
    end

    def find_user_question
      @user_question = @user_quiz.users_questions.find(params[:question_id]) if params[:question_id]
    end

    def next_question
      @user_question = @user_quiz.users_questions.not_answered.first unless @user_question
    end

    def quiz_params
      params.require(:quiz).permit(:name, :description, :duration, :distribution_skills, :distribution_rule)
    end
  end
end
