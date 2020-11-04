class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]
  def index
    @items = Item.all.includes(:user)
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    @item.save
    if @item.save
      redirect_to root_path
    else 
      @items = Item.all.includes(:user)
      render :new 
    end  
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :days_id, :price ).merge(user_id: current_user.id)
  end  
end
