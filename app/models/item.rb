class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliverystatus
  belongs_to_active_hash :shippingprefecture
  belongs_to_active_hash :preparationday
  has_one_attached :image
  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :image
    validates :item_explanation
    validates :category_id
    validates :condition_id
    validates :deliverystatus_id
    validates :shippingprefecture_id
    validates :preparationday_id
    validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :deliverystatus_id
    validates :shippingprefecture_id
    validates :preparationday_id
  end

end
