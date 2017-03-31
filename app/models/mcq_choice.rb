class McqChoice < ApplicationRecord
	# model association
  	belongs_to :mcq_question

  	# validation
  	validates_presence_of :text

  	before_save :falsify_all_others

  	private 

  	def falsify_all_others
		if is_correct
			McqChoice.where.not(id: id).where(mcq_question_id: mcq_question_id).update_all(is_correct: false)
		end
	end

end
