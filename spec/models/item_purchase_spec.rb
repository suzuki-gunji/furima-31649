require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end
    
    context '商品購入ができる時' do
      it '全ての値が正しい場合保存できること' do
        expect(@item_purchase).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @item_purchase.building = nil
        @item_purchase.valid?
      end
    end

    context '商品購入ができない時' do
      it 'tokenが空だと登録できない' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Tokenを入力してください")
      end
      it 'postal_codeが空だと登録できない' do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal codeを入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ形式でないと保存できないこと' do
        @item_purchase.postal_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal codeが間違っています (-)が必要です")
      end
      it 'prefecture_idが空だと登録できない' do
        @item_purchase.prefecture_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefectureを入力してください")
      end
      it 'prefecture_idが1だと登録できない' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end
      it 'cityが空だと登録できない' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Cityを入力してください")
      end
      it 'house_numberが空だと登録できない' do
        @item_purchase.house_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("House numberを入力してください")
      end
      it 'phone_numberが空だと登録できない' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberを入力してください")
      end
      it 'phone_numberが12桁だと登録できない' do
        @item_purchase.phone_number = 123456789123
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone numberが間違っています")
      end
    end

    
  end
end
