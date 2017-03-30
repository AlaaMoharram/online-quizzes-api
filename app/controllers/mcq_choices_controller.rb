class McqChoicesController < ApplicationController

	before_action :set_quiz, :set_mcq_question
	before_action :set_mcq_question_mcq_choice, only: [:show, :update, :destroy]

	# GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices
	def index
		json_response(@mcq_question.mcq_choices)
	end

	# GET /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
	def show
		json_response(@mcq_choice)
	end

	# POST /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices
	def create
		@mcq_question.mcq_choices.create!(mcq_choice_params)
	    json_response(@quiz, :created)
	end

	# PUT /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
	def update
		@mcq_choice.update(mcq_choice_params)
	    head :no_content
	end

	# DELETE /quizzes/:quiz_id/mcq_questions/:mcq_question_id/mcq_choices/:id
	def destroy
	    @mcq_choice.destroy
	    head :no_content
	end

	private

	def mcq_choice_params
		params.permit(:text, :is_correct)
	end

	def set_quiz
		@quiz = Quiz.find(params[:quiz_id])
	end

	def set_mcq_question
		@mcq_question = McqQuestion.find(params[:mcq_question_id])
	end

	def set_mcq_question_mcq_choice
		@mcq_choice = @mcq_question.mcq_choices.find_by!(id: params[:id]) if @mcq_question
	end

end
