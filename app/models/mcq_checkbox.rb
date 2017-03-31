class McqCheckbox < ApplicationRecord
  belongs_to :quiz
  has_many :mcq_checkbox_choices

  validates_presence_of :text
end
