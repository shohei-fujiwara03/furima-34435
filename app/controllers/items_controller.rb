class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end



private

def item_params
  params.require(:item).permit(:image, :title, :price, :details, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
end