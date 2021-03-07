FactoryBot.define do
  factory :item_buyer do
    token             { 'tk_abab01010101010101010101cdcd' }
    zip_code          { '111-2222' }
    ship_from_area_id { Faker::Number.between(from: 2, to: 48) }
    city              { Gimei.city.kanji }
    address_line_1    { Gimei.town.kanji }
    address_line_2    { 'マンション'}
    phone_number      { Faker::Number.leading_zero_number(digits: 11)}
    user_id           { Faker::Number.between(from: 1, to: 100)}
    item_id           { Faker::Number.between(from: 1, to: 300)}
  end
end
