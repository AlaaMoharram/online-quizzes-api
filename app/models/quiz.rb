class Quiz < ApplicationRecord
	# model association
  	has_many :mcq_questions, dependent: :destroy
  	has_many :short_answer_questions, dependent: :destroy

  	# validations
  	validates_presence_of :title
end
