class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_date

  belongs_to :user
  has_one :order
  has_many_attached :images

  with_options presence:true do

    validates :title
    validates :details
    validates :images
    validates :price,numericality: {with:/\A[0-9]+\z/,message:"は半角数字でないと登録できません"},inclusion: { in: 300..9_999_999,message:"が許容範囲を超えています" }

    with_options numericality: { other_than: 1,message:"を選択してください" }  do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    end

  end


  
end
