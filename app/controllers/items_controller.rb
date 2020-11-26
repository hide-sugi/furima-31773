class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :item_explanation, :category_id, :condition_id, :deliverystatus_id, :shippingprefecture_id, :preparationday_id, :price).merge(user_id: current_user.id)
  end
# end

# ①再起動
# ②ターミナルで　git add . → git commit -m “test” → git push heroic master