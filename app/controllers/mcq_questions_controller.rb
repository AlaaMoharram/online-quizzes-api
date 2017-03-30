class McqQuestionsController < ApplicationController

	before_action :set_quiz
	before_action :set_quiz_mcq_question, only: [:show, :update, :destroy]

	# GET /quizzes/:quiz_id/mcq_questions
	def index
		json_response(@quiz.mcq_questions)
	end

	# GET /quizzes/:quiz_id/mcq_questions/:id
	def show
		json_response(@mcq_question)
	end

	# POST /quizzes/:quiz_id/mcq_questions
	def create
		@quiz.mcq_questions.create!(mcq_question_params)
	    json_response(@quiz, :created)
	end

	# PUT /quizzes/:quiz_id/mcq_questions/:id
	def update
		@mcq_question.update(mcq_question_params)
	    head :no_content
	end

	# DELETE /quizzes/:quiz_id/mcq_questions/:id
	def destroy
	    @mcq_question.destroy
	    head :no_content
	end

	private

	def mcq_question_params
		params.permit(:text)
	end

	def set_quiz
		@quiz = Quiz.find(params[:quiz_id])
	end

	def set_quiz_mcq_question
		@mcq_question = @quiz.mcq_questions.find_by!(id: params[:id]) if @quiz
	end

end
