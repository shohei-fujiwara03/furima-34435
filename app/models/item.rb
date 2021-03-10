class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_date

  belongs_to :user
  has_one_attached :image

  with_options presence:true do

    validates :title
    validates :details
    validates :image
    validates :price,numericality: {with:/\A[0-9]+\z/,message:"must be half integer"},inclusion: { in: 300..9_999_999,message:"is beyond acceptable limits" }

    with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    end

  end


  
end
