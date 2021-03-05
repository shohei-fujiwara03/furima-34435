class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

         validates :nickname, presence: true
         validates :family_name, presence: true,format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/,message:"must be full-pitch character"}
         validates :first_name, presence: true,format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/,message:"must be full-pitch character"}
         validates :family_name_kana, presence: true,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message:"must be full-width katakana"}
         validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message:"must be full-width katakana"}
         validates :birth_date, presence: true
         validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/,message:"include both letters and numbers"}
         validates :email,format: { with: VALID_EMAIL_REGEX ,message:"must include @"}
end
