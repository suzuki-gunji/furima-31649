require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての入力が正常に行われれば登録できる' do
        expect(@user).to be_valid
      end
    end  
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end    
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end    
      it "emailは@がないと登録できない" do
        @user.email = "abcyahoo.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end    
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "英数字混合でもpasswordが5文字以下では登録できない" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英語のみの場合登録できない" do
        @user.password = "ddddddd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end  
      it "passwordが数字のみの場合登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end  
      it "passwordとpassword_confirmationが異なると登録できない" do
        @user.password = "a123456"
        @user.password_confirmation = "b123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "名字が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名前が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名字が全角でない場合は登録できない" do
        @user.last_name = "s"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name には全角文字を使用してください")
      end
      it "名前が全角でない場合は登録できない" do
        @user.first_name = "s"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it "名字のフリガナが空では登録できない" do
        @user.last_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading can't be blank")
      end
      it "名前のフリガナが空では登録できない" do
        @user.first_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading can't be blank")
      end
      it "名字のフリガナが全角のカタカナでない場合は登録できない" do
        @user.last_reading = "s"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last reading には全角のカタカナを使用してください")
      end
      it "名前のフリガナが全角のカタカナでない場合は登録できない" do
        @user.first_reading = "s"
        @user.valid?
        expect(@user.errors.full_messages).to include("First reading には全角のカタカナを使用してください")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end  
  end
end
