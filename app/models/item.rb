class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence:true do
    validates :title
    validates :category_id
    validates :condition_id
    validates :price
    validates :details
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end


  
end
