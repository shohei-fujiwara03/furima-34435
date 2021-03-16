class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_index,only: [:index]
  

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_shipping).permit(:zip_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id:current_user.id,item_id:@item.id,token:params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_7a081ea96c6650c9c04183f5"  
    Payjp::Charge.create(
      amount: order_shipping_params[:price],  
      card: order_shipping_params[:token],    
      currency: 'jpy'                 
    )
  end
end
