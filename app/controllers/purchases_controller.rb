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
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

 def purchase_params
  params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def set_item
  @item = Item.find(params[:item_id])
 end

 def pay_item
  Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    card: purchase_params[:token],    
    currency: 'jpy'                 
  )
 end
 
 
 def move_to_index
  if  @item.purchase.present?
  redirect_to root_path 
  end
 end
 
end
