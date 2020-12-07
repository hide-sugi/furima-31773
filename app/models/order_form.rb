class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :deliveryprefecture_id, :municipality, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,           format: { with: /\A\d{3}-\d{4}\z/ }
    validates :deliveryprefecture_id, numericality: { other_than: 0, message: "は---以外の値を入力してください" }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :item_id
    validates :token
  end

  def save
    buyer = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, deliveryprefecture_id: deliveryprefecture_id, municipality: municipality, house_number: house_number, phone_number: phone_number, order_id: buyer.id)
  end
end
