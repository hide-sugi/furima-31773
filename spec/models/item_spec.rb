require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と販売価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'item_explanationが空だと出品できない' do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが0だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは---以外の値を入力してください")
      end
      it 'condition_idが0だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は---以外の値を入力してください")
      end
      it 'deliverystatus_idが0だと出品できない' do
        @item.deliverystatus_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は---以外の値を入力してください")
      end
      it 'shippingprefecture_idが0だと出品できない' do
        @item.shippingprefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は---以外の値を入力してください")
      end
      it 'preparationday_idが0だと出品できない' do
        @item.preparationday_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は---以外の値を入力してください")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は不正な値です")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが300円未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが9999999円を超過すると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end
