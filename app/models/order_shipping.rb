class OrderShipping
  include ActiveModel::Model
  attr_accessor :zip_code,:prefecture_id,:city,:address,:building_name,:phone_number,:order_id,:user_id,:item_id

  with_options presence:true  do
    validates :city
    validates :address
    validates :order_id
    validates :user_id
    validates :item_id
    validates :zip_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number,numericality: {with: /\A[0-9]{11}\z/, message: "is only 11 integer"}
  end
    validates :prefecture_id,numericality: { other_than: 1 } 

    def index
      order = Order.create(user_id:user_id, item_id: item_id)
      Shipping.create(zip_code: zip_code, prefecture_id:prefecture_id, address:address,building_name:building_name,phone_number:phone_number,order_id:order.id )
    end
end