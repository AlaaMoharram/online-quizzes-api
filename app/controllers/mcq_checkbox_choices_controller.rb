class McqCheckboxChoicesController < ApplicationController

	before_action :set_quiz, :set_mcq_checkbox
	before_action :set_checkbox_choice, only: [:show, :update, :destroy]

	# GET /quizzes/:quiz_id/mcq_checkboxes/:mcq_checkbox_id/mcq_checkbox_choices
	def index
		json_response(@mcq_checkbox.mcq_checkbox_choices)
	end

	# GET /quizzes/:quiz_id/mcq_checkboxes/:mcq_checkbox_id/mcq_checkbox_choices/:id
	def show
		json_response(@checkbox_choice)
	end

	# POST /quizzes/:quiz_id/mcq_checkboxes/:mcq_checkbox_id/mcq_checkbox_choices
	def create
		@mcq_checkbox.mcq_checkbox_choices.create!(checkbox_choice_params)
	    json_response(@quiz, :created)
	end

	# PUT /quizzes/:quiz_id/mcq_checkboxes/:mcq_checkbox_id/mcq_checkbox_choices/:id
	def update
		@checkbox_choice.update(checkbox_choice_params)
	    head :no_content
	end

	# DELETE /quizzes/:quiz_id/mcq_checkboxes/:mcq_checkbox_id/mcq_checkbox_choices/:id
	def destroy
	    @checkbox_choice.destroy
	    head :no_content
	end

	private

	def checkbox_choice_params
		params.permit(:text, :is_correct)
	end

	def set_quiz
		@quiz = Quiz.find(params[:quiz_id])
	end

	def set_mcq_checkbox
		@mcq_checkbox = McqCheckbox.find(params[:mcq_checkbox_id])
	end

	def set_checkbox_choice
		@checkbox_choice = @mcq_checkbox.mcq_checkbox_choices.find_by!(id: params[:id]) if @mcq_checkbox
	end
end
