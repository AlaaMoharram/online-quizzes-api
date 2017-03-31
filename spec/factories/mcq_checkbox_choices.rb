FactoryGirl.define do
  factory :mcq_checkbox_choice do
    text { Faker::Company.catch_phrase }
    is_correct false
    mcq_checkbox_id nil
  end
end