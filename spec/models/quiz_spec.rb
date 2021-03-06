require 'rails_helper'

RSpec.describe Quiz, type: :model do
  # Association test
  # ensure Quiz model has a one-to-many relationship with the Question models
  it { should have_many(:mcq_questions).dependent(:destroy) }
  it { should have_many(:short_answer_questions).dependent(:destroy) }
  # Validation tests
  # ensure columns title is present before saving
  it { should validate_presence_of(:title) }
end
