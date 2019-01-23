class ItemsController < ApplicationController

  protect_from_forgery :except => [:pay]

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
    render :layout => 'add-header'
  end

  def item_page
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      flash.now[:notice] = '商品出品に失敗しました'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    render :layout => 'add-header&pankuzu'
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    item.update( buyer_id: current_user.id )
    redirect_to action: :index
  end

  def destroy
    item = Item.find(params[:id])
    if item.seller_id == current_user.id
      item.destroy
      redirect_to root_path
    else
      render :item_page
    end
  end


  def new
    @item = Item.new
    @item.images.build
    gon.large_categories = Category.roots

    midium_categories = []
    Category.roots.each do |root_category|
      midium_categories << Category.children_of(root_category)
    end
    @midium_categories = midium_categories


    @small_categories = []
    Category.roots.each do |root_category|
      Category.children_of(root_category).each do |small_category|
        @small_categories << Category.children_of(small_category)
      end
    end
  end

  def brand_search
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
     respond_to do |format|
     format.html
     format.json
    end
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @keyword = params[:keyword]
    render :layout => 'add-header&pankuzu'
  end


  private

    def item_params
      params.require(:item).permit(:name, :price, :status, :size, :condition, :introduction, :shipping_charge, :shipping_days, :origin_region, :shipping_method, :category_id, :brand, :buyer_id, images_attributes: [:image]).merge(seller_id: current_user.id)
    end

    def update_item_params
      params.require(:item).permit(:name, :price, :status, :size, :condition, :introduction, :shipping_charge, :shipping_days, :origin_region, :shipping_method, :category_id, :brand, :buyer_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
    end

end
