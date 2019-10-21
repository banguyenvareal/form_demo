FactoryBot.define do
  factory :bank_account do
    name { Faker::Book.title }
    balance { rand(10..100) }
    user
  end
end
