require 'rails_helper'

RSpec.describe McqQuestion, type: :model do
  # Association test
  # ensure a question record belongs to a single quiz record
  it { should belong_to(:quiz) }
  # Validation test
  # ensure column text is present before saving
  it { should validate_presence_of(:text) }
end
