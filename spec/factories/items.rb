FactoryBot.define do
  factory :item do
    name                   { 'マグカップ' }
    item_explanation       { '使いやすい最高の商品です' }
    category_id            { 1 }
    condition_id           { 1 }
    deliverystatus_id      { 1 }
    shippingprefecture_id  { 1 }
    preparationday_id      { 1 }
    price                  { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
