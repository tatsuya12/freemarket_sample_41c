class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.seller_id == current_user.id
  end
end
