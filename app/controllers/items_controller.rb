class ItemsController < ApplicationController

  protect_from_forgery :except => [:pay]

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
  end

  def sell
    @item = Item.new
  end

  def create
    # @item = Item.new(item_params)
    brand = Brand.find_by(name: item_params[:brand])
    # @item.brand_id = brand.id
    category = Category.find_by(name: item_params[:category])
    # @item.category_id = category.id
    @item = Item.new( name: item_params[:name],
                     price: item_params[:price],
                     status: item_params[:status],
                     size: item_params[:size],
                     condition: item_params[:condition],
                     introduction: item_params[:introduction],
                     category_id: category.id,
                     brand_id: brand.id,
                     seller_id: current_user.id)
    # @item.seller_id = current_user.id

    if @item.save
      redirect_to detail_item_path(@item)
    else
      render :index
    end

    # name: item_params[:name],
    #                  price: item_params[:price],
    #                  status: item_params[:status],
    #                  size: item_params[:size],
    #                  condition: item_params[:condition],
    #                  introduction: item_params[:introduction],
    #                  category: item_params[:category],
    #                  seller_id: current_user.id

    # Item.create(name: item_params[:name], price: item_params[:price], status: item_params[:status], size: item_params[:size], condition: item_params[:condition], introduction: item_params[:introduction], category: item_params[:category], seller_id: current_user.id)
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
      params.permit(:name, :price, :status, :size, :condition, :introduction, :category, :brand, :image)
    end
end
