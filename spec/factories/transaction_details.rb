require 'faker'

FactoryBot.define do
  factory :transaction_detail do
    name { Faker::Lorem.word }
    amount { Faker::Number.number(digits: 5) }
    user { FactoryBot.create(:user) }
  end
end
