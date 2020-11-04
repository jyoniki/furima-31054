class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :postage_payes_id, :prefecture_id, :handling_tims_id, :price).merge(user_id: current_user.id)
  end


end
