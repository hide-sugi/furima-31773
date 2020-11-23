class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparationday
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :image
    validates :item_explanation
    validates :item_category_id,       numericality: { other_than: 1 }
    validates :item_condition_id,      numericality: { other_than: 1 }
    validates :delivery_fee_status_id, numericality: { other_than: 1 }
    validates :shipping_prefecture_id, numericality: { other_than: 1 }
    validates :preparation_day_id,     numericality: { other_than: 1 }
    validates :price,                  numericality: { greater_than: 300, less_than: 9999999 }, format: { with: /\A[0-9]+\z/ }
    
  end
end
