FactoryBot.define do 
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 10, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    gimei = Gimei.name
    first_name            {gimei.first.hiragana}
    last_name             {gimei.last.kanji}
    first_name_kana       {gimei.first.katakana}
    last_name_kana        {gimei.last.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end