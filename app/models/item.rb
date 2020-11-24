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
    validates :item_category_id
    validates :item_condition_id
    validates :delivery_fee_status_id
    validates :shipping_prefecture_id
    validates :preparation_day_id
    validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 0 } do
    validates :item_category_id
    validates :item_condition_id
    validates :delivery_fee_status_id
    validates :shipping_prefecture_id
    validates :preparation_day_id
  end
  
end
