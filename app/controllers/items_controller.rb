class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

  def detail
    @item = Item.find(params[:id])
  end


  # before_create :add_currency

  # def add_currency
  #   self.price = "¥" + price
  # end

end
