FactoryGirl.define do
  factory :mcq_checkbox do
    text { Faker::StarWars.character }
    quiz_id nil
  end
end