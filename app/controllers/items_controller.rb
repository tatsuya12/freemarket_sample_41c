class ItemsController < ApplicationController

  protect_from_forgery :except => [:pay]
  before_action :set_item, only: [:item_page, :show, :edit, :update, :detail, :pay, :destroy]
  before_action :require_login, only: [:new, :create]
  before_action :confirm_user_id, only: [:edit, :destroy]

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
    render :layout => 'add-header'
  end

  def item_page
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      flash.now[:alert] = '商品出品に失敗しました'
      render :new
    end
  end

  def show
    render :layout => 'add-header&pankuzu'
  end

  def edit
  end

  def update
    if @item.update(update_item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def detail
  end

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @item.update( buyer_id: current_user.id )
    redirect_to action: :index
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  def new
    @item = Item.new
    @item.images.build
  end

  def brand_search
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
     respond_to do |format|
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

    def set_item
      @item = Item.find(params[:id])
    end

    def require_login
      redirect_to new_user_session_url unless user_signed_in?
    end

    def confirm_user_id
      @item.seller_id == current_user.id
    end

end
