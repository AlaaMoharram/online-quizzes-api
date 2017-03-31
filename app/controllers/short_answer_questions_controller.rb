class ShortAnswerQuestionsController < ApplicationController

	before_action :set_quiz
	before_action :set_quiz_sa_question, only: [:show, :update, :destroy]

	# GET /quizzes/:quiz_id/short_answer_questions
	def index
		json_response(@quiz.short_answer_questions)
	end

	# GET /quizzes/:quiz_id/short_answer_questions/:id
	def show
		json_response(@sa_question)
	end

	# POST /quizzes/:quiz_id/short_answer_questions
	def create
		@quiz.short_answer_questions.create!(sa_question_params)
	    json_response(@quiz, :created)
	end

	# PUT /quizzes/:quiz_id/short_answer_questions/:id
	def update
		@sa_question.update(sa_question_params)
	    head :no_content
	end

	# DELETE /quizzes/:quiz_id/short_answer_questions/:id
	def destroy
	    @sa_question.destroy
	    head :no_content
	end

	private

	def sa_question_params
		params.permit(:text)
	end

	def set_quiz
		@quiz = Quiz.find(params[:quiz_id])
	end

	def set_quiz_sa_question
		@sa_question = @quiz.short_answer_questions.find_by!(id: params[:id]) if @quiz
	end

end
