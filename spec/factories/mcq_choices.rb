FactoryGirl.define do
  factory :mcq_choice do
    text { Faker::Company.catch_phrase }
    is_correcr false
    mcq_question_id nil
  end
end