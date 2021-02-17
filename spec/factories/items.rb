FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.characters(number: 10) }
    description       { Faker::Lorem.sentences(number: 3) }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    charge_id         { Faker::Number.between(from: 2, to: 3) }
    ship_from_area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
