class McqCheckboxesController < ApplicationController

	before_action :set_quiz
	before_action :set_quiz_mcq_checkbox, only: [:show, :update, :destroy]

	# GET /quizzes/:quiz_id/mcq_checkboxes
	def index
		json_response(@quiz.mcq_checkboxes)
	end

	# GET /quizzes/:quiz_id/mcq_checkboxes/:id
	def show
		json_response(@mcq_checkbox)
	end

	# POST /quizzes/:quiz_id/mcq_checkboxes
	def create
		@quiz.mcq_checkboxes.create!(mcq_checkbox_params)
	    json_response(@quiz, :created)
	end

	# PUT /quizzes/:quiz_id/mcq_checkboxes/:id
	def update
		@mcq_checkbox.update(mcq_checkbox_params)
	    head :no_content
	end

	# DELETE /quizzes/:quiz_id/mcq_checkboxes/:id
	def destroy
	    @mcq_checkbox.destroy
	    head :no_content
	end

	private

	def mcq_checkbox_params
		params.permit(:text)
	end

	def set_quiz
		@quiz = Quiz.find(params[:quiz_id])
	end

	def set_quiz_mcq_checkbox
		@mcq_checkbox = @quiz.mcq_checkboxes.find_by!(id: params[:id]) if @quiz
	end

end
