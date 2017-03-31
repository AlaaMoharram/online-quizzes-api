class ShortAnswerQuestion < ApplicationRecord
	# model association
  	belongs_to :quiz

  	# validation
  	validates_presence_of :text
end
