class ItemsController < ApplicationController
  before_action :authenticate_user!, onlu: [:new,]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(items_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :item_explanation, :item_category_id, :item_condition_id, :delivery_fee_status_id, :shipping_prefecture_id, :preparation_day_id, :price, )
  end
end
