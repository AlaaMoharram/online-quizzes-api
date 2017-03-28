FactoryGirl.define do
  factory :quiz do
    title { Faker::Lorem.words(rand(2..10)).join(' ') }
  end
end