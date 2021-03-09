class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :move_to_index,only: [:edit]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    if Item.create(item_params)
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

def move_to_index
  @prototype = Prototype.find(params[:id])
  unless current_user == @prototype.user
    redirect_to action: :index
  end
end
