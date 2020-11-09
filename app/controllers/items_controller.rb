class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,]
  before_action :find_params, only: [:show, :edit, :update, :destroy, :move_to_index,]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new 
    end  
  end

  def show
  end  

  def edit
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path
    else 
      render :edit
    end 
  end 
  
  def destroy
    @item.destroy
    redirect_to root_path
  end  

  def move_to_index
    @user = current_user.id
    unless user_signed_in? && @item.user_id == @user
      redirect_to action: :index
    end  
  end  

  def find_params
    @item = Item.find(params[:id])
  end  

  private
  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id, :price ).merge(user_id: current_user.id)
  end  
end
