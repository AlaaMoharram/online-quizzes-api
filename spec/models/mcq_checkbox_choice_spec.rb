require 'rails_helper'

RSpec.describe McqCheckboxChoice, type: :model do
  	# Association test
  	# ensure a choice record belongs to a single mcq_question record
  	it { should belong_to(:mcq_checkbox) }

  	# Validation test
  	# ensure column text is present before saving
  	it { should validate_presence_of(:text) }
end
