class ItemsController < ApplicationController
  def index
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
