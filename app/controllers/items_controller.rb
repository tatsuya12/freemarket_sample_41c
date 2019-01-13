class ItemsController < ApplicationController

  def index
  	@items = Item.includes(:images).limit(4).order("created_at DESC")
  end

  def show
  end

end
