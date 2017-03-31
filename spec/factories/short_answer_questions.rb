FactoryGirl.define do
  factory :short_answer_question do
    text { Faker::StarWars.character }
    quiz_id nil
  end
end