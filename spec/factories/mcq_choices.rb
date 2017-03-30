FactoryGirl.define do
  factory :mcq_choice do
    text { Faker::Company.catch_phrase }
    is_correct false
    mcq_question_id nil
  end
end