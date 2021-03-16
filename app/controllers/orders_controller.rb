class OrdersController < ApplicationController

  

  def index
    @item =Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:zip_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id:current_item.id)
  end
end
