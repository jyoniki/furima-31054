class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to item_path
    else
      render action: :index
    end
  end
  
  private

 def address_params
  params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id])
 end

end
