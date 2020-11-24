class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :item_explanation, :item_category_id, :item_condition_id, :delivery_fee_status_id, :shipping_prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
