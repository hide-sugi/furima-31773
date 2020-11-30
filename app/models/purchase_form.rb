class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :deliveryprefecture_id, :municipality, :house_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code,          format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :deliveryprefecture_id
    validates :municipality
    validates :house_number
    validates :phone_number
  end
  def save
  end
end