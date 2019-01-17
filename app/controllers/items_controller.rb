class ItemsController < ApplicationController

  protect_from_forgery :except => [:pay]

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
  end

  def item_page
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to item_path(@item)
    else
      flash.now[:notice] = '商品出品に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @images = @item.images
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(update_item_params)
      redirect_to root_path
    else
      render :edit
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

  def destroy
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      item.destroy!
      redirect_to root_path
    else
      render :item_page
    end
  end


  def new
    @item = Item.new
    @item.images.build
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
  end


  private

    def item_params
      params.require(:item).permit(:name, :price, :status, :size, :condition, :introduction, :shipping_charge, :shipping_days, :origin_region, :shipping_method, :category_id, :brand_id, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
    end

    def update_item_params
      params.require(:item).permit(:name, :price, :status, :size, :condition, :introduction, :shipping_charge, :shipping_days, :origin_region, :shipping_method, :category_id, :brand_id, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end

end
