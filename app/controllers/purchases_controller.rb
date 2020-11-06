class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @purchase_address = PurchaseAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

 def address_params
  params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
 end

 def set_item
  @item = Item.find(params[:item_id])
 end
 

 def move_to_index
  if  @item.purchase.present?
  redirect_to root_path 
  end
 end
 
end
