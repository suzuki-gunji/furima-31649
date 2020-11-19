class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :purchase_item_confirm, only: [:index]
  before_action :user_purchase_confirm, only: [:index]

  def index
    @item_purchase = ItemPurchase.new
  end

  def create 
    @item_purchase = ItemPurchase.new(purchase_params)
    @item.update(buyer_id: current_user.id)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else  
      render action: :index
    end  
  end

  private

  def item_find
    @item = Item.find(params[:item_id])
  end  

  def purchase_params
    params.require(:item_purchase).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,  
        card: purchase_params[:token],    
        currency: 'jpy'                 
      )
  end  

  def purchase_item_confirm
    if @item.buyer_id.present?
      redirect_to root_path
    end  
  end  

  def user_purchase_confirm
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end  
end
