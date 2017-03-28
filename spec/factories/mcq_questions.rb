FactoryGirl.define do
  factory :mcq_question do
    text { Faker::StarWars.character }
    quiz_id nil
  end
end