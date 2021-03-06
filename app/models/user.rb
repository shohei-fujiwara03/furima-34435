class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        with_options presence:true do
         validates :nickname
         validates :birth_date

         with_options format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/,message:"は全角でなければ登録できません"} do
         validates :family_name
         validates :first_name
         end

         with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message:"は全角カタカナでないと登録できません"} do
         validates :family_name_kana
         validates :first_name_kana
         end
         
         validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/,message:"は英数混合でなければ登録できません"}
        end


        has_many :items
        has_many :orders
end
