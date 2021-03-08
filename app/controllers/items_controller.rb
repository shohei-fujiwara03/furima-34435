class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :move_to_index,only: [:edit]

  def index
  end

  def new
    @item = Item.new
  end

  def create

  end
end



private

def move_to_index
  @prototype = Prototype.find(params[:id])
  unless current_user == @prototype.user
    redirect_to action: :index
  end
end
