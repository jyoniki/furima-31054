FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code              { '111-1111' }
    prefecture_id          { 5 }
    city                   { 'テスト' }
    house_number           { 'てすと' }
    building_name          { 'テテテテテテ' }
    phone_number           { '01045678923' }
  end
end
