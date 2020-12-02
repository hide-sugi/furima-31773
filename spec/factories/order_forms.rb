FactoryBot.define do
  factory :order_form do
    postal_code           {"000-0000"}
    deliveryprefecture_id {1}
    municipality          {"横浜市緑区"}
    house_number          {"青山1-1-1"}
    phone_number          {"00000000000"}
  end
end
