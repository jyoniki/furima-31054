FactoryBot.define do
  factory :item do
    name              {'物'}
    description_item  {'そこらへんの物'}
    category_id       {'3'}
    condition_id      {'3'}
    postage_payes_id  {'3'}
    prefecture_id     {'3'}
    handling_tims_id  {'3'}
    price             {'600'}
    user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
