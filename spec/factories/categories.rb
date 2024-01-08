require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Faker::Lorem.word }
    user { FactoryBot.create(:user) }
  end
end
