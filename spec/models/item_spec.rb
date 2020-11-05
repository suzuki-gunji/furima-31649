require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての入力が正常に行われれば登録できる' do
        expect(@item).to be_valid
      end
    end 
    context '商品出品ががうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "explainが空だと登録できない" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "status_idが空だと登録できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "delivery_fee_idが空だと登録できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "days_idが空だと登録できない" do
        @item.days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが41文字以上だと登録できない" do
        @item.name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "priceが¥299以下だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥10000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end  
  end   
end
