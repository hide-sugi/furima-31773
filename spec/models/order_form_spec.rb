require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @order_form = FactoryBot.build(:order_form, user_id: buyer.id, item_id: item.id)
  end

  describe '出品した商品の購入' do
    context '商品の購入がうまく行くとき' do
      it 'postal_codeとdeliveryprefecture_idとmunicipalityとhouse_numberとphone_numberとtokenがあれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @order_form.postal_code = '0000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'deliveryprefecture_idが空だと購入できない' do
        @order_form.deliveryprefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県は---以外の値を入力してください")
      end
      it 'deliveryprefecture_idが未選択だと購入できない' do
        @order_form.deliveryprefecture_id = '0'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県は---以外の値を入力してください")
      end
      it 'municipalityが空だと購入できない' do
        @order_form.municipality = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空だと購入できない' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberが11桁以内ではないと購入できない' do
        @order_form.phone_number = '000000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tokenが空だと購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("正しいカード情報を入力してください")
      end
    end
  end
end
