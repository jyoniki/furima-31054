FactoryBot.define do
  factory :purchase_address do
    post_code              { '111-1111' }
    prefecture_id          { 5 }
    city                   { 'テスト'}
    house_number           { 'てすと' }
    building_name          { 'テテテテテテ' }
    phone_number           { '01045678923' }
  end
end
