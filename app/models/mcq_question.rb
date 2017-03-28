class McqQuestion < ApplicationRecord
	# model association
  	belongs_to :quiz
  	has_many :mcq_choices

  	# validation
  	validates_presence_of :text
end
