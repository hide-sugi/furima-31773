require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の出品' do
    context "商品の出品ができる場合" do
      it "画像と商品名と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と販売価格があれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品が出品できない場合" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "item_explanationが空だと出品できない" do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it "category_idが0だと出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "condition_idが0だと出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "deliverystatus_idが0だと出品できない" do
        @item.deliverystatus_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery status must be other than 0")
      end
      it "shippingprefecture_idが0だと出品できない" do
        @item.shippingprefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture must be other than 0")
      end
      it "preparation_day_idが0だと出品できない" do
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparationday must be other than 0")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが半角数字でないと出品できない" do
        @item.price = "００００"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      it "priceが300円未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it "priceが9999999円を超過すると登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end
    end
  end
end

