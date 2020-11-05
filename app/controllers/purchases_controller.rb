class PurchasesController < ApplicationController

  def index
    purchaseaddress = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end
  
  def create
  end
  

end
