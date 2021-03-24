require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
   context '新規商品を出品できる時' do    

    it '必須項目が全て存在していれば保存できること' do
      expect(@item).to be_valid
    end
    it '商品価格は半角数字であれば登録できる' do
      @item.price = 400
      expect(@item).to be_valid
    end
    it '商品価格は300円以上であれば登録できる' do
      @item.price = 300
      expect(@item).to be_valid
    end
    it '商品価格は9,999,999円以下であれば登録できる' do
      @item.price = 9_999_999
      expect(@item).to be_valid
    end

   end


   context '新規商品を出品できない時' do

    it '商品名が空では登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '詳細が空では登録できない' do
      @item.details = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("詳細欄を入力してください")
    end
    it 'sがないと出品できない' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it 'カテゴリーidが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end
    it 'コンディションidが1では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("商品状態を選択してください")
    end
    it '都道府県idが1では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("都道府県を選択してください")
    end
    it '配送料idが1では登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料を選択してください")
    end
    it '発送日idが1では登録できない' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end
    it '商品価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("料金を入力してください")
    end
    it 'priceが300円以下だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("料金が許容範囲を超えています")
    end
    it 'priceが9,999,999円以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("料金が許容範囲を超えています")
    end
    it '商品価格は全角数字では登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("料金は半角数字でないと登録できません")
    end
    it '商品価格は半角英数字混合では登録できない' do
      @item.price = "300dollers"
      @item.valid?
      expect(@item.errors.full_messages).to include("料金は半角数字でないと登録できません")
    end
    it '商品価格は半角英字のみでは登録できない' do
      @item.price = "one-thousand dollers"
      @item.valid?
      expect(@item.errors.full_messages).to include("料金は半角数字でないと登録できません")
    end


   end
  


  end
end
