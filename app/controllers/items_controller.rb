class ItemsController < ApplicationController

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      tweet.destroy
    else
      redirect_to action: :index
    end
  end
end
