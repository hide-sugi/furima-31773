FactoryBot.define do
  factory :item do
    name                   { "マグカップ" }
    item_explanation       { "使いやすい最高の商品です" }
    item_category_id       { 1 }
    item_condition_id      { 1 }
    delivery_fee_status_id { 1 }
    shipping_prefecture_id { 1 }
    preparation_day_id     { 1 }
    price                  { 300 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
