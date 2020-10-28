FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '123aaa' }
    password_confirmation { password }
    first_name            { 'てすと' }
    last_name             { 'てす' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テス' }
    birth_day             { '2000-01-01' }
  end
end
