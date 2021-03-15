class OrderShipping
  include ActiveModel::Model
  attr_accessor :zip_code,:prefecture_id,:city,:address,:building_name,:phone_number,:order_id,:user_id,:item_id
end