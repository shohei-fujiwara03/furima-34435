require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it '必須入力項目が全て存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'メールアドレスは@が含まれていれば登録できる' do
      @user.email = 'example@gmail.com'
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上、かつ半角英数字混合で一致していれば登録できる' do
      @user.password = 'pass00'
     @user.password_confirmation = 'pass00'
     expect(@user).to be_valid
    end
    it 'ユーザー本名は全角であれば登録できる' do
    @user.family_name = '赤'
    @user.first_name = '赤'
    expect(@user).to be_valid
    end
    it 'ユーザー本名（カナ）は全角カタカナであれば登録できる' do
      @user.family_name_kana = 'アカ'
      @user.first_name_kana = 'アカ'
      expect(@user).to be_valid
    end
   end


  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it "emailには@が含まれていないと登録できない" do
      @user.email = "example.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "名字が空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end
    it "名字が全角でないと登録できない" do
      @user.family_name = "aka"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓は全角でなければ登録できません")
    end
    it "名前が空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください")
    end
    it "名前は全角でないと登録できない" do
      @user.first_name = "aka"
      @user.valid?
      expect(@user.errors.full_messages).to include("名は全角でなければ登録できません")
    end
    it "名字（カナ）が空では登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
    end
    it "名字（カナ）は全角カタカナでないと登録できない" do
      @user.family_name_kana = "赤"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）は全角カタカナでないと登録できません")
    end
    it "名前（カナ）が空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名（カナ）を入力してください")
    end
    it "名前（カナ）は全角カタカナでないと登録できない" do
      @user.first_name_kana = "赤"
      @user.valid?
      expect(@user.errors.full_messages).to include("名（カナ）は全角カタカナでないと登録できません")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include"パスワード（確認用）とパスワードの入力が一致しません"
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'pass00'
      @user.password_confirmation = 'pass001'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "3d3"
      @user.password_confirmation = "3d3"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが6文字以上でも数字のみでは登録できない' do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英数混合でなければ登録できません")
   end
   it 'passwordが6文字以上でも英字のみでは登録できない' do
    @user.password = "aaaaaa"
    @user.password_confirmation = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは英数混合でなければ登録できません")
   end
   it "passwordが全角の場合は登録できない" do
    @user.password = "ｐｔｋ００１"
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは英数混合でなければ登録できません")
  end
   it "生年月日が空では登録できない" do
    @user.birth_date = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("誕生日を入力してください")
  end

  
  end
end
end
