class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]


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
    #@item = Item.find(params[:id])
  end

  def edit
    #@item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

  def update
    #@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description_item, :category_id, :condition_id, :postage_payes_id, :prefecture_id, :handling_tims_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
