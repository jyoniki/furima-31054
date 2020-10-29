class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,]

  def index
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
  

  private

  def item_params
    params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :postage_payes_id, :prefecture_id, :handling_tims_id, :price).merge(user_id: current_user.id)
  end  
end
