class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      item.update(item_params)
    end
  end

  def detail
    @item = Item.find(params[:id])
  end


  private
    def item_params
      params.permit(:name, :price, :status, :size, :condition, :introduction)
    end


end
