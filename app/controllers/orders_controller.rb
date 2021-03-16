class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index,only: [:index]
  

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:zip_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id:current_user.id,item_id:@item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end
end
