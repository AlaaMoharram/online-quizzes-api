class McqCheckboxChoice < ApplicationRecord
  belongs_to :mcq_checkbox

  validates_presence_of :text
end
