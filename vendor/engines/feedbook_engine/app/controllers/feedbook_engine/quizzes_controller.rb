require_dependency 'feedbook_engine/application_controller'

module FeedbookEngine
  class QuizzesController < ApplicationController

    skip_before_action :restrict_access
    before_action :find_quiz, only: [:start]
    before_action :find_user_quiz, only: [:show, :finish]
    before_action :find_user_question, only: [:show, :finish]

    def show
      redirect_to start_quiz_url(params[:id]) unless session[:current_question]
      next_question
    end

    def start
      @user_quiz = QuizUser.generate_user_quiz(current_user.id, @quiz.id) unless @user_quiz
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

    def find_user_question
      @user_question = QuestionUserAnswer.find(session[:current_question]) if session[:current_question]
    end

    def quiz_params
      params.require(:quiz).permit(:name, :description, :duration, :distribution_skills, :distribution_rule)
    end

    def get_question
      questions_answered = @user_quiz.question_user_answers.pluck(:question_id) << 0
      questions = @user_quiz.questions.where('feedbook_questions.id not in (?)', questions_answered).first
      question_user_answer = @user_quiz.question_user_answers.build
      question_user_answer.question_id = question.id
      question_user_answer.save
      question_user_answer
    end

    def next_question
      @user_question = get_question unless @user_question
      session[:current_question] = @user_question.id
    end
  end
end
