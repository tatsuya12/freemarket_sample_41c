class ItemsController < ApplicationController

  protect_from_forgery :except => [:pay]

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
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

  def pay
    item = Item.find(params[:id])
    Payjp.api_key = 'sk_test_ac690b2754bd406439b882d0'
    Payjp::Charge.create(
      amount: item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to action: :index
  end


  private
    def item_params
      params.permit(:name, :price, :status, :size, :condition, :introduction)
    end
end
