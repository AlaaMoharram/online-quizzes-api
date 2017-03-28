class McqChoice < ApplicationRecord
	# model association
  	belongs_to :mcq_question

  	# validation
  	validates_presence_of :text
end
