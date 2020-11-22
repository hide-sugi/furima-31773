class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparationday
  with_options presence: true do
    validates :name
    validates :item_explanation
    validates :item_category_id,       numericality: { other_than: 1 }
    validates :item_condition_id,      numericality: { other_than: 1 }
    validates :delivery_fee_status_id, numericality: { other_than: 1 }
    validates :shipping_prefecture_id, numericality: { other_than: 1 }
    validates :preparation_day_id,     numericality: { other_than: 1 }
    validates :price
    validates :user
  end
end
