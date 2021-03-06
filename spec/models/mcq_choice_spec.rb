require 'rails_helper'

RSpec.describe McqChoice, type: :model do
	# Association test
  	# ensure a choice record belongs to a single mcq_question record
  	it { should belong_to(:mcq_question) }

  	# Validation test
  	# ensure column text is present before saving
  	it { should validate_presence_of(:text) }

  	# Ensure the existence of before_save callback
  	it { should callback(:falsify_all_others).before(:save) }
  	
end
