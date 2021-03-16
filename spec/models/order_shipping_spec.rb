require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id,item_id:item.id)
      sleep(0.01)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping).to be_valid
    end
    it 'building_nameが空でも登録できる' do
      @order_shipping.building_name = ""
      expect(@order_shipping).to be_valid
    end
    it 'zip_codeが空だと保存できない' do
      @order_shipping.zip_code = ""
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'zip_codeはハイフンが含まれていないと保存できない' do
      @order_shipping.zip_code = 1234567
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idは1より大きくないと保存できない' do
    @order_shipping.prefecture_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では保存できない' do
      @order_shipping.city = ""
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では保存できない' do
      @order_shipping.address = ""
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では保存できない' do
      @order_shipping.phone_number = ""
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberは11桁で無いと保存できない' do
      @order_shipping.phone_number = '123456789011'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Phone number is only 11 integer")
    end

  end
end